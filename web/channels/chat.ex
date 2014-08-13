defmodule WebsocketsElixir.Chat do
  use Phoenix.Channel

  def join(socket, "chat", _message) do
    IO.puts "JOIN #{socket.channel}:#{socket.topic}"
    reply socket, "join", %{status: "connected"}
    {:ok, socket}
  end

  def event(socket, "chat:message", message) do
    broadcast "chat", "global", "chat:message", %{message: message}
    socket
  end

  def join(socket, _private_topic, _message) do
    {:error, socket, :unauthorized}
  end
end
