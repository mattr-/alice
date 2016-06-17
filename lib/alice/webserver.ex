defmodule Alice.Webserver do
  @default_port 8191

  def start_link(nil), do: start_server(@default_port)
  def start_link(port), do: port |> String.to_integer() |> start_server

  defp start_server(port) do
    Plug.Adapters.Cowboy.http Alice.WebRouter, [], port: port
  end
end
