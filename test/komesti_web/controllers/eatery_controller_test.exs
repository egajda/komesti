defmodule KomestiWeb.EateryControllerTest do
  use KomestiWeb.ConnCase

  alias Komesti.Seller
  alias Komesti.Seller.Eatery

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:eatery) do
    {:ok, eatery} = Seller.create_eatery(@create_attrs)
    eatery
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all eateries", %{conn: conn} do
      conn = get(conn, Routes.eatery_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create eatery" do
    test "renders eatery when data is valid", %{conn: conn} do
      conn = post(conn, Routes.eatery_path(conn, :create), eatery: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.eatery_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.eatery_path(conn, :create), eatery: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update eatery" do
    setup [:create_eatery]

    test "renders eatery when data is valid", %{conn: conn, eatery: %Eatery{id: id} = eatery} do
      conn = put(conn, Routes.eatery_path(conn, :update, eatery), eatery: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.eatery_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, eatery: eatery} do
      conn = put(conn, Routes.eatery_path(conn, :update, eatery), eatery: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete eatery" do
    setup [:create_eatery]

    test "deletes chosen eatery", %{conn: conn, eatery: eatery} do
      conn = delete(conn, Routes.eatery_path(conn, :delete, eatery))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.eatery_path(conn, :show, eatery))
      end
    end
  end

  defp create_eatery(_) do
    eatery = fixture(:eatery)
    {:ok, eatery: eatery}
  end
end
