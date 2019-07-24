defmodule Komesti.Repo do
  use Ecto.Repo,
    otp_app: :komesti,
    adapter: Ecto.Adapters.Postgres
end
