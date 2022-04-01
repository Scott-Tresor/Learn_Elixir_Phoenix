defmodule SocialNetworkElixir.Repo do
  use Ecto.Repo,
    otp_app: :social_network_elixir,
    adapter: Ecto.Adapters.MyXQL
end
