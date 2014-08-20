use Mix.Config

config :phoenix, WebsocketsElixir.Router,
  port: System.get_env("PORT") || 80,
  ssl: false,
  code_reload: false,
  cookies: true,
  session_key: "_websockets_elixir_key",
  session_secret: "O@0V3K(DI417J3!V+ZZM2ONZ*E19C125+5V13(Q$B51=FJKXG%UYZ)FBE%HWZM9O1(V3GTQSGIL"

config :phoenix, :logger,
  level: :error
