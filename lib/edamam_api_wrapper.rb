require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  EDAMAM_KEY = ENV["EDAMAM_KEY"]
  EDAMAM_ID = ENV["EDAMAM_ID"]

  def self.getRecipeList(search_term)
    url = BASE_URL + "?app_id=#{EDAMAM_ID}" + "&app_key=#{EDAMAM_KEY}" + "&q=#{search_term}" + "&returns=Hits&recipe=Recipe"

    response = HTTParty.get(url).parsed_response["hits"]

    recipes = []

    if response == nil
      return recipes
    else
      response.each_with_index do | recipe, i |
        name = response[i]["recipe"]["label"]
        uri = response[i]["recipe"]["uri"]
        image = response[i]["recipe"]["image"]

        recipe = Recipe.new(name, uri, image)
        recipes << recipe
      end
    end

    return recipes
  end

  def self.getRecipe(uri)
    url = BASE_URL + "?r=#{uri}"
    response = HTTParty.get(url).parsed_response

    name = response[0]["label"]
    uri = response[0]["uri"]
    image = response[0]["image"]
    recipe_source = response[0]["source"]
    url = response[0]["url"]
    health_labels = response[0]["healthLabels"]
    ingredient_lines = response[0]["ingredientLines"]

    response = Recipe.new(name, uri, image, recipe_source: recipe_source, health_labels: health_labels, ingredient_lines: ingredient_lines, url: url)
  end

end
