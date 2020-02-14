require "json"
require "open-uri"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
a = open(url).read
drinks = JSON.parse(a)
drinks_list = drinks["drinks"]

drinks_list.each do |drink|
  Ingredient.create(name: drink["strIngredient1"])
end
