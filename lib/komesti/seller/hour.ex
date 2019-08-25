defmodule Komesti.Seller.Hour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hours" do
    field :eatery_id, :id
    field :monday_end, :time
    field :monday_start, :time
    field :tuesday_end, :time
    field :tuesday_start, :time
    field :wednesday_end, :time
    field :wednesday_start, :time
    field :thursday_end, :time
    field :thursday_start, :time
    field :friday_end, :time
    field :friday_start, :time
    field :saturday_end, :time
    field :saturday_start, :time
    field :sunday_end, :time
    field :sunday_start, :time

    timestamps()
  end

  @doc false
  def changeset(hour, attrs) do
    hour
    |> cast(attrs, [:monday_start, :monday_end, :tuesday_start, :tuesday_end, :wednesday_start, :wednesday_end, :thursday_start, :thursday_end, :friday_start, :friday_end, :saturday_start, :saturday_end, :sunday_start, :sunday_end])
    |> validate_required([:monday_start, :monday_end, :tuesday_start, :tuesday_end, :wednesday_start, :wednesday_end, :thursday_start, :thursday_end, :friday_start, :friday_end, :saturday_start, :saturday_end, :sunday_start, :sunday_end])
  end
end
