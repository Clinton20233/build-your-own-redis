import gleam/io
// Uncomment this block to pass the first stage
// import gleam/result
// import glisten/socket/options.{ActiveMode, Passive}
// import glisten/tcp

pub fn main() {
  // You can use print statements as follows for debugging, they'll be visible when running tests.
  io.println("Logs from your program will appear here!")

  // Uncomment this block to pass the first stage
  // use listener <- result.then(tcp.listen(6379, [ActiveMode(Passive)]))
  // use _socket <- result.then(tcp.accept(listener))

  Ok(Nil)
}
