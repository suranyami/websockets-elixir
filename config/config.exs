# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, WebsocketsElixir.Router,
  port: System.get_env("PORT"),
  ssl: false,
  code_reload: false,
  static_assets: true,
  cookies: true,
  session_key: "_websockets_elixir_key",
  session_secret: "O@0V3K(DI417J3!V+ZZM2ONZ*E19C125+5V13(Q$B51=FJKXG%UYZ)FBE%HWZM9O1(V3GTQSGIL"

config :phoenix, :logger,
  level: :error

config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
