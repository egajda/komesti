defmodule KomestiWeb.HourController do
  use KomestiWeb, :controller

  alias Komesti.Seller
  alias Komesti.Seller.Hour

  action_fallback KomestiWeb.FallbackController

  def index(conn, _params) do
    hours = Seller.list_hours()
    render(conn, "index.json", hours: hours)
  end

  def create(conn, %{"hour" => hour_params}) do
    with {:ok, %Hour{} = hour} <- Seller.create_hour(hour_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.hour_path(conn, :show, hour))
      |> render("show.json", hour: hour)
    end
  end

  def show(conn, %{"id" => id}) do
    hour = Seller.get_hour!(id)
    render(conn, "show.json", hour: hour)
  end

  def update(conn, %{"id" => id, "hour" => hour_params}) do
    hour = Seller.get_hour!(id)

    with {:ok, %Hour{} = hour} <- Seller.update_hour(hour, hour_params) do
      render(conn, "show.json", hour: hour)
    end
  end

  def delete(conn, %{"id" => id}) do
    hour = Seller.get_hour!(id)

    with {:ok, %Hour{}} <- Seller.delete_hour(hour) do
      send_resp(conn, :no_content, "")
    end
  end
end
