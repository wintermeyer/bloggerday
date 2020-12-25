defmodule Bloggerday.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Bloggerday.Repo,
      # Start the Telemetry supervisor
      BloggerdayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bloggerday.PubSub},
      # Start the Endpoint (http/https)
      BloggerdayWeb.Endpoint
      # Start a worker by calling: Bloggerday.Worker.start_link(arg)
      # {Bloggerday.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bloggerday.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BloggerdayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
