defmodule KomestiWeb.HourControllerTest do
  use KomestiWeb.ConnCase

  alias Komesti.Seller
  alias Komesti.Seller.Hour

  @create_attrs %{
    friday_end: ~T[14:00:00],
    friday_start: ~T[14:00:00],
    monday_end: ~T[14:00:00],
    monday_start: ~T[14:00:00],
    saturday_end: ~T[14:00:00],
    saturday_start: ~T[14:00:00],
    sunday_end: ~T[14:00:00],
    sunday_start: ~T[14:00:00],
    thursday_end: ~T[14:00:00],
    thursday_start: ~T[14:00:00],
    tuesday_end: ~T[14:00:00],
    tuesday_start: ~T[14:00:00],
    wednesday_end: ~T[14:00:00],
    wednesday_start: ~T[14:00:00]
  }
  @update_attrs %{
    friday_end: ~T[15:01:01],
    friday_start: ~T[15:01:01],
    monday_end: ~T[15:01:01],
    monday_start: ~T[15:01:01],
    saturday_end: ~T[15:01:01],
    saturday_start: ~T[15:01:01],
    sunday_end: ~T[15:01:01],
    sunday_start: ~T[15:01:01],
    thursday_end: ~T[15:01:01],
    thursday_start: ~T[15:01:01],
    tuesday_end: ~T[15:01:01],
    tuesday_start: ~T[15:01:01],
    wednesday_end: ~T[15:01:01],
    wednesday_start: ~T[15:01:01]
  }
  @invalid_attrs %{friday_end: nil, friday_start: nil, monday_end: nil, monday_start: nil, saturday_end: nil, saturday_start: nil, sunday_end: nil, sunday_start: nil, thursday_end: nil, thursday_start: nil, tuesday_end: nil, tuesday_start: nil, wednesday_end: nil, wednesday_start: nil}

  def fixture(:hour) do
    {:ok, hour} = Seller.create_hour(@create_attrs)
    hour
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all hours", %{conn: conn} do
      conn = get(conn, Routes.hour_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create hour" do
    test "renders hour when data is valid", %{conn: conn} do
      conn = post(conn, Routes.hour_path(conn, :create), hour: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.hour_path(conn, :show, id))

      assert %{
               "id" => id,
               "friday_end" => "14:00:00",
               "friday_start" => "14:00:00",
               "monday_end" => "14:00:00",
               "monday_start" => "14:00:00",
               "saturday_end" => "14:00:00",
               "saturday_start" => "14:00:00",
               "sunday_end" => "14:00:00",
               "sunday_start" => "14:00:00",
               "thursday_end" => "14:00:00",
               "thursday_start" => "14:00:00",
               "tuesday_end" => "14:00:00",
               "tuesday_start" => "14:00:00",
               "wednesday_end" => "14:00:00",
               "wednesday_start" => "14:00:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.hour_path(conn, :create), hour: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update hour" do
    setup [:create_hour]

    test "renders hour when data is valid", %{conn: conn, hour: %Hour{id: id} = hour} do
      conn = put(conn, Routes.hour_path(conn, :update, hour), hour: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.hour_path(conn, :show, id))

      assert %{
               "id" => id,
               "friday_end" => "15:01:01",
               "friday_start" => "15:01:01",
               "monday_end" => "15:01:01",
               "monday_start" => "15:01:01",
               "saturday_end" => "15:01:01",
               "saturday_start" => "15:01:01",
               "sunday_end" => "15:01:01",
               "sunday_start" => "15:01:01",
               "thursday_end" => "15:01:01",
               "thursday_start" => "15:01:01",
               "tuesday_end" => "15:01:01",
               "tuesday_start" => "15:01:01",
               "wednesday_end" => "15:01:01",
               "wednesday_start" => "15:01:01"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, hour: hour} do
      conn = put(conn, Routes.hour_path(conn, :update, hour), hour: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete hour" do
    setup [:create_hour]

    test "deletes chosen hour", %{conn: conn, hour: hour} do
      conn = delete(conn, Routes.hour_path(conn, :delete, hour))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.hour_path(conn, :show, hour))
      end
    end
  end

  defp create_hour(_) do
    hour = fixture(:hour)
    {:ok, hour: hour}
  end
end
