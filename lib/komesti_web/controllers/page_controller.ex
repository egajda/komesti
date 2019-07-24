defmodule KomestiWeb.PageController do
  use KomestiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
