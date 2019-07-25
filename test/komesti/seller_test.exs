defmodule Komesti.SellerTest do
  use Komesti.DataCase

  alias Komesti.Seller

  describe "eateries" do
    alias Komesti.Seller.Eatery

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def eatery_fixture(attrs \\ %{}) do
      {:ok, eatery} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Seller.create_eatery()

      eatery
    end

    test "list_eateries/0 returns all eateries" do
      eatery = eatery_fixture()
      assert Seller.list_eateries() == [eatery]
    end

    test "get_eatery!/1 returns the eatery with given id" do
      eatery = eatery_fixture()
      assert Seller.get_eatery!(eatery.id) == eatery
    end

    test "create_eatery/1 with valid data creates a eatery" do
      assert {:ok, %Eatery{} = eatery} = Seller.create_eatery(@valid_attrs)
      assert eatery.name == "some name"
    end

    test "create_eatery/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Seller.create_eatery(@invalid_attrs)
    end

    test "update_eatery/2 with valid data updates the eatery" do
      eatery = eatery_fixture()
      assert {:ok, %Eatery{} = eatery} = Seller.update_eatery(eatery, @update_attrs)
      assert eatery.name == "some updated name"
    end

    test "update_eatery/2 with invalid data returns error changeset" do
      eatery = eatery_fixture()
      assert {:error, %Ecto.Changeset{}} = Seller.update_eatery(eatery, @invalid_attrs)
      assert eatery == Seller.get_eatery!(eatery.id)
    end

    test "delete_eatery/1 deletes the eatery" do
      eatery = eatery_fixture()
      assert {:ok, %Eatery{}} = Seller.delete_eatery(eatery)
      assert_raise Ecto.NoResultsError, fn -> Seller.get_eatery!(eatery.id) end
    end

    test "change_eatery/1 returns a eatery changeset" do
      eatery = eatery_fixture()
      assert %Ecto.Changeset{} = Seller.change_eatery(eatery)
    end
  end
end
