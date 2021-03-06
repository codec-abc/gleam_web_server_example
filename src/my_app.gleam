import gleam/io
import gleam/http/elli
import gleam/http.{Request, Response}
import gleam/bit_builder.{BitBuilder}

// Define a HTTP service
//
pub fn my_service(req: Request(BitString)) -> Response(BitBuilder) {
  let body = bit_builder.from_string("Hello, world!")

  http.response(200)
  |> http.prepend_resp_header("made-with", "Gleam")
  |> http.set_resp_body(body)
}

pub fn start() {
  io.print("starting service")
  elli.start(my_service, on_port: 8000)
}