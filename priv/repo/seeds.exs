# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pento.Repo.insert!(%Pento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Pento.Catalog

products = [
  %{
    name: "Chess",
    description: "A classic strategy game",
    sku: 5_678_910,
    unit_price: 10.00
  },
  %{
    name: "Checkers",
    description: "The game of kings",
    sku: 1_234_567,
    unit_price: 5.00
  },
  %{
    name: "Backgammon",
    description: "This game is over 5,000 years old",
    sku: 15_222_324,
    unit_price: 15.00
  },
  %{
    name: "Zelda of Legend",
    description: "A classic adventure game",
    sku: 8_643_367,
    unit_price: 5.00
  }
]

Enum.each(products, fn product ->
  Catalog.create_product(product)
end)
