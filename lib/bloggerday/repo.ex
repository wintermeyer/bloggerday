defmodule Bloggerday.Repo do
  use Ecto.Repo,
    otp_app: :bloggerday,
    adapter: Ecto.Adapters.Postgres
end
