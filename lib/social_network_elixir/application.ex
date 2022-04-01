defmodule SocialNetworkElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SocialNetworkElixir.Repo,
      # Start the Telemetry supervisor
      SocialNetworkElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SocialNetworkElixir.PubSub},
      # Start the Endpoint (http/https)
      SocialNetworkElixirWeb.Endpoint
      # Start a worker by calling: SocialNetworkElixir.Worker.start_link(arg)
      # {SocialNetworkElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SocialNetworkElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SocialNetworkElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
