defmodule Alice.WebRouter do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/ping" do
    send_resp(conn, 200, "OK")
  end

  match _ do
    send_resp(conn, 404, "404 - Not Found")
  end
end
