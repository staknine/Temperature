defmodule Temperature.Repo do
  use Ecto.Repo,
    otp_app: :temperature,
    adapter: Ecto.Adapters.Postgres
end
