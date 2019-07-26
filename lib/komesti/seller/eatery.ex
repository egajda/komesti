defmodule Komesti.Seller.Eatery do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :slug}

  schema "eateries" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(eatery, attrs) do
    eatery
    |> cast(attrs, [:name, :slug])
    |> slugify_name
    |> validate_required([:name])
  end

  defp slugify_name(changeset) do
    if name = get_change(changeset, :name) do
      put_change(changeset, :slug, slugify(name))
    else 
      changeset
    end
  end

  defp slugify(str) do
    str
    |> String.downcase
    |> String.replace(~r/[^\w-]+/u, "-")
  end
end

defimpl Phoenix.Param, for: Komesti.Seller.Eatery do
  def to_param(%{slug: slug}) do
    "#{slug}"
  end
end
