require 'test_helper'

describe Recipe do

it "Cannot be initialized with less than 3 parameters" do
  proc {
    Recipe.new
  }.must_raise ArgumentError

  proc {
    Recipe.new("Name")
  }.must_raise ArgumentError

  proc {
    Recipe.new("Name", "URI")
  }.must_raise ArgumentError
end

it "Can create a new Recipe if 3 parameters are given" do
  recipe = Recipe.new("Name", "URI", "Image")
  recipe.class.must_equal Recipe
end

it "Can create a Recipe with optional params" do
  recipe = Recipe.new("Name", "URI", "Image", { recipe_source: "Sourcery!" })
  recipe.class.must_equal Recipe
  recipe.recipe_source.must_equal "Sourcery!"
end

it "Must initialize name & id properly" do
  recipe = Recipe.new("Name", "URI", "Image")
  recipe.name.must_equal "Name"
  recipe.uri.must_equal "URI"
  recipe.image.must_equal "Image"
end

it "Has the accessor methods" do
  recipe = Recipe.new("Name", "URI", "Image", {
    recipe_source: "recipe source",
    health_labels: "label",
    ingredient_lines: "ingredient",
    url: "URL"
    }
  )

  recipe.name.must_equal "Name"
  recipe.uri.must_equal "URI"
  recipe.image.must_equal "Image"
  recipe.recipe_source.must_equal "recipe source"
  recipe.health_labels.must_equal "label"
  recipe.ingredient_lines.must_equal "ingredient"
  recipe.url.must_equal "URL"
end

end
