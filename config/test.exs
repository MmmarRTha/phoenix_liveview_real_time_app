import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :my_real_time_app, MyRealTimeApp.Repo,
  username: "postgres",
  password: "marthap0p",
  hostname: "localhost",
  database: "my_real_time_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :my_real_time_app, MyRealTimeAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "P7Uf+ybB71xqZT/F+PW/3kM9tm5yDmwFEfAfOrl7P66LuiHTUj8lOD1QJRAgm9cP",
  server: false

# In test we don't send emails.
config :my_real_time_app, MyRealTimeApp.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
