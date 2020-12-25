# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bloggerday,
  ecto_repos: [Bloggerday.Repo]

# Configures the endpoint
config :bloggerday, BloggerdayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yx5a8QRJjeAWPcYklxqWWhsYXBKggh0ReNHtO5CFSc0rkseUUQbKuBPU//85yVsy",
  render_errors: [view: BloggerdayWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Bloggerday.PubSub,
  live_view: [signing_salt: "YdtvO8aw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
