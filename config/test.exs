import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :social_network_elixir, SocialNetworkElixir.Repo,
  username: "root",
  password: "",
  hostname: "localhost",
  database: "social_network_elixir_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :social_network_elixir, SocialNetworkElixirWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "/U4pCe4nS8C1sx6j4+yBF3Otb4Au5XXuXI5wcQBi0ab6EkrAPMJYPNHkTZMdzmQH",
  server: false

# In test we don't send emails.
config :social_network_elixir, SocialNetworkElixir.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
