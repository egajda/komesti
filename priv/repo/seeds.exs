# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Komesti.Repo.insert!(%Komesti.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Komesti.Seller
Seller.create_eatery(%{"name" => "Newburgh Grill"})
Seller.create_eatery(%{"name" => "Telegraph Grill"})
Seller.create_eatery(%{"name" => "Livonia Grill"})
Seller.create_eatery(%{"name" => "Redford Grill"})
