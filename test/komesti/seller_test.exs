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

  describe "hours" do
    alias Komesti.Seller.Hour

    @valid_attrs %{friday_end: ~T[14:00:00], friday_start: ~T[14:00:00], monday_end: ~T[14:00:00], monday_start: ~T[14:00:00], saturday_end: ~T[14:00:00], saturday_start: ~T[14:00:00], sunday_end: ~T[14:00:00], sunday_start: ~T[14:00:00], thursday_end: ~T[14:00:00], thursday_start: ~T[14:00:00], tuesday_end: ~T[14:00:00], tuesday_start: ~T[14:00:00], wednesday_end: ~T[14:00:00], wednesday_start: ~T[14:00:00]}
    @update_attrs %{friday_end: ~T[15:01:01], friday_start: ~T[15:01:01], monday_end: ~T[15:01:01], monday_start: ~T[15:01:01], saturday_end: ~T[15:01:01], saturday_start: ~T[15:01:01], sunday_end: ~T[15:01:01], sunday_start: ~T[15:01:01], thursday_end: ~T[15:01:01], thursday_start: ~T[15:01:01], tuesday_end: ~T[15:01:01], tuesday_start: ~T[15:01:01], wednesday_end: ~T[15:01:01], wednesday_start: ~T[15:01:01]}
    @invalid_attrs %{friday_end: nil, friday_start: nil, monday_end: nil, monday_start: nil, saturday_end: nil, saturday_start: nil, sunday_end: nil, sunday_start: nil, thursday_end: nil, thursday_start: nil, tuesday_end: nil, tuesday_start: nil, wednesday_end: nil, wednesday_start: nil}

    def hour_fixture(attrs \\ %{}) do
      {:ok, hour} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Seller.create_hour()

      hour
    end

    test "list_hours/0 returns all hours" do
      hour = hour_fixture()
      assert Seller.list_hours() == [hour]
    end

    test "get_hour!/1 returns the hour with given id" do
      hour = hour_fixture()
      assert Seller.get_hour!(hour.id) == hour
    end

    test "create_hour/1 with valid data creates a hour" do
      assert {:ok, %Hour{} = hour} = Seller.create_hour(@valid_attrs)
      assert hour.friday_end == ~T[14:00:00]
      assert hour.friday_start == ~T[14:00:00]
      assert hour.monday_end == ~T[14:00:00]
      assert hour.monday_start == ~T[14:00:00]
      assert hour.saturday_end == ~T[14:00:00]
      assert hour.saturday_start == ~T[14:00:00]
      assert hour.sunday_end == ~T[14:00:00]
      assert hour.sunday_start == ~T[14:00:00]
      assert hour.thursday_end == ~T[14:00:00]
      assert hour.thursday_start == ~T[14:00:00]
      assert hour.tuesday_end == ~T[14:00:00]
      assert hour.tuesday_start == ~T[14:00:00]
      assert hour.wednesday_end == ~T[14:00:00]
      assert hour.wednesday_start == ~T[14:00:00]
    end

    test "create_hour/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Seller.create_hour(@invalid_attrs)
    end

    test "update_hour/2 with valid data updates the hour" do
      hour = hour_fixture()
      assert {:ok, %Hour{} = hour} = Seller.update_hour(hour, @update_attrs)
      assert hour.friday_end == ~T[15:01:01]
      assert hour.friday_start == ~T[15:01:01]
      assert hour.monday_end == ~T[15:01:01]
      assert hour.monday_start == ~T[15:01:01]
      assert hour.saturday_end == ~T[15:01:01]
      assert hour.saturday_start == ~T[15:01:01]
      assert hour.sunday_end == ~T[15:01:01]
      assert hour.sunday_start == ~T[15:01:01]
      assert hour.thursday_end == ~T[15:01:01]
      assert hour.thursday_start == ~T[15:01:01]
      assert hour.tuesday_end == ~T[15:01:01]
      assert hour.tuesday_start == ~T[15:01:01]
      assert hour.wednesday_end == ~T[15:01:01]
      assert hour.wednesday_start == ~T[15:01:01]
    end

    test "update_hour/2 with invalid data returns error changeset" do
      hour = hour_fixture()
      assert {:error, %Ecto.Changeset{}} = Seller.update_hour(hour, @invalid_attrs)
      assert hour == Seller.get_hour!(hour.id)
    end

    test "delete_hour/1 deletes the hour" do
      hour = hour_fixture()
      assert {:ok, %Hour{}} = Seller.delete_hour(hour)
      assert_raise Ecto.NoResultsError, fn -> Seller.get_hour!(hour.id) end
    end

    test "change_hour/1 returns a hour changeset" do
      hour = hour_fixture()
      assert %Ecto.Changeset{} = Seller.change_hour(hour)
    end
  end
end
