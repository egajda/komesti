defmodule Komesti.Seller do
  @moduledoc """
  The Seller context.
  """

  import Ecto.Query, warn: false
  alias Komesti.Repo

  alias Komesti.Seller.Eatery

  @doc """
  Returns the list of eateries.

  ## Examples

      iex> list_eateries()
      [%Eatery{}, ...]

  """
  def list_eateries do
    Repo.all(Eatery)
  end

  @doc """
  Gets a single eatery.

  Raises `Ecto.NoResultsError` if the Eatery does not exist.

  ## Examples

      iex> get_eatery!(123)
      %Eatery{}

      iex> get_eatery!(456)
      ** (Ecto.NoResultsError)

  """
  def get_eatery!(id), do: Repo.get!(Eatery, id)

  @doc """
  Creates a eatery.

  ## Examples

      iex> create_eatery(%{field: value})
      {:ok, %Eatery{}}

      iex> create_eatery(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_eatery(attrs \\ %{}) do
    %Eatery{}
    |> Eatery.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a eatery.

  ## Examples

      iex> update_eatery(eatery, %{field: new_value})
      {:ok, %Eatery{}}

      iex> update_eatery(eatery, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_eatery(%Eatery{} = eatery, attrs) do
    eatery
    |> Eatery.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Eatery.

  ## Examples

      iex> delete_eatery(eatery)
      {:ok, %Eatery{}}

      iex> delete_eatery(eatery)
      {:error, %Ecto.Changeset{}}

  """
  def delete_eatery(%Eatery{} = eatery) do
    Repo.delete(eatery)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking eatery changes.

  ## Examples

      iex> change_eatery(eatery)
      %Ecto.Changeset{source: %Eatery{}}

  """
  def change_eatery(%Eatery{} = eatery) do
    Eatery.changeset(eatery, %{})
  end
end
