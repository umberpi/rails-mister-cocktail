# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'pry-byebug'
require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

serialized_cocktails = open(url).read

cocktails_seeds = JSON.parse(serialized_cocktails)
cocktail_array = cocktails_seeds["drinks"]
cocktail_array.each do |cocktail|
  Ingredient.create(name: cocktail["strIngredient1"])
end
