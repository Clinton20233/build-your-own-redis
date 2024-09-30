import Foundation
import NIO

// Create an event loop group to manage network events
let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)

// Shut down the event loop group
defer {
    try? group.syncShutdownGracefully()
}

// Set up a channel for the server to listen on port 6379
let serverBootstrap = ServerBootstrap(group: group)
// Set SO_REUSEADDR to true
    .serverChannelOption(ChannelOptions.socketOption(.so_reuseaddr), value: 1)
// Handle incoming connections
    .childChannelInitializer { channel in
        // You can add channel handlers here if needed
        return channel.eventLoop.makeSucceededFuture(())
    }

// Bind the server to port 6379 and start accepting connections
let channel = try serverBootstrap.bind(host: "localhost", port: 6379).wait()
print("Server started and listening on \(channel.localAddress!)")
try channel.closeFuture.wait()
print("Server closed")
