defmodule MyRealTimeApp.Repo do
  use Ecto.Repo,
    otp_app: :my_real_time_app,
    adapter: Ecto.Adapters.Postgres
end
