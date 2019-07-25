defmodule Komesti.Seller.Eatery do
  use Ecto.Schema
  import Ecto.Changeset

  schema "eateries" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(eatery, attrs) do
    eatery
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
