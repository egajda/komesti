defmodule Komesti.Repo.Migrations.CreateEateries do
  use Ecto.Migration

  def change do
    create table(:eateries) do
      add :name, :string
      add :slug, :string

      timestamps()
    end

  end
end
