defmodule KomestiWeb.EateryController do
  use KomestiWeb, :controller

  alias Komesti.Seller
  alias Komesti.Seller.Eatery

  alias Komesti.Repo

  action_fallback KomestiWeb.FallbackController

  def index(conn, _params) do
    eateries = Seller.list_eateries()
    render(conn, "index.json", eateries: eateries)
  end

  def create(conn, %{"eatery" => eatery_params}) do
    with {:ok, %Eatery{} = eatery} <- Seller.create_eatery(eatery_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.eatery_path(conn, :show, eatery))
      |> render("show.json", eatery: eatery)
    end
  end

  def show(conn, %{"slug" => slug}) do
    #eatery = Seller.get_eatery!(id)
    eatery = Repo.get_by!(Eatery, slug: slug)
    render(conn, "show.json", eatery: eatery)
  end

  def update(conn, %{"slug" => slug, "eatery" => eatery_params}) do
    #eatery = Seller.get_eatery!(id)
    eatery = Repo.get_by!(Eatery, slug: slug)

    with {:ok, %Eatery{} = eatery} <- Seller.update_eatery(eatery, eatery_params) do
      render(conn, "show.json", eatery: eatery)
    end
  end

  def delete(conn, %{"slug" => slug}) do
    #eatery = Seller.get_eatery!(id)
    eatery = Repo.get_by!(Eatery, slug: slug)

    with {:ok, %Eatery{}} <- Seller.delete_eatery(eatery) do
      send_resp(conn, :no_content, "")
    end
  end
end
