defmodule WebsocketsElixir.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :websockets_elixir
  get "/", WebsocketsElixir.PageController, :index, as: :page

  use Phoenix.Router.Socket, mount: "/ws"
  channel "chat", WebsocketElixir.Chat
end
