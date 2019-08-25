defmodule KomestiWeb.HourView do
  use KomestiWeb, :view
  alias KomestiWeb.HourView

  def render("index.json", %{hours: hours}) do
    %{data: render_many(hours, HourView, "hour.json")}
  end

  def render("show.json", %{hour: hour}) do
    %{data: render_one(hour, HourView, "hour.json")}
  end

  def render("hour.json", %{hour: hour}) do
    %{id: hour.id,
      monday_start: hour.monday_start,
      monday_end: hour.monday_end,
      tuesday_start: hour.tuesday_start,
      tuesday_end: hour.tuesday_end,
      wednesday_start: hour.wednesday_start,
      wednesday_end: hour.wednesday_end,
      thursday_start: hour.thursday_start,
      thursday_end: hour.thursday_end,
      friday_start: hour.friday_start,
      friday_end: hour.friday_end,
      saturday_start: hour.saturday_start,
      saturday_end: hour.saturday_end,
      sunday_start: hour.sunday_start,
      sunday_end: hour.sunday_end}
  end
end
