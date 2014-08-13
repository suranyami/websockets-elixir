defmodule WebsocketsElixir.Chat do
  use Phoenix.Channel

  def join(socket, "chat", _message) do
    IO.puts "JOIN #{socket.channel}:#{socket.topic}"
    reply socket, "join", %{status: "connected"}
    {:ok, socket}
  end

  def join(socket, _private_topic, _message) do
    {:error, socket, :unauthorized}
  end

  def event(socket, "message", message) do
    IO.puts "message: #{socket.channel}:#{socket.topic}"
    IO.puts message["data"]
    broadcast "chat", "chat", "message", message["data"]
    socket
  end
end
