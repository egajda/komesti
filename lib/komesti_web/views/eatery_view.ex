defmodule KomestiWeb.EateryView do
  use KomestiWeb, :view
  alias KomestiWeb.EateryView

  def render("index.json", %{eateries: eateries}) do
    %{data: render_many(eateries, EateryView, "eatery.json")}
  end

  def render("show.json", %{eatery: eatery}) do
    %{data: render_one(eatery, EateryView, "eatery.json")}
  end

  def render("eatery.json", %{eatery: eatery}) do
    %{id: eatery.id,
      name: eatery.name}
  end
end
