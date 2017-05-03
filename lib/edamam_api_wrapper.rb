require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  EDAMAM_KEY = ENV["EDAMAM_KEY"]
  EDAMAM_ID = ENV["EDAMAM_ID"]

  def self.getRecipeList()
    url = BASE_URL + "?app_id=#{EDAMAM_ID}" + "&app_key=#{EDAMAM_KEY}" + "&q=pesto" + "&from=1&to=10" + "&returns=Hits&recipe=Recipe"

    response = HTTParty.get(url).parsed_response["hits"]
    # response = HTTParty.get(url).parsed_response["hits"][1]["recipe"]["label"]


    recipes = []

    if response[1]["recipe"]
      response.each do | recipe |
        name = response[1]["recipe"]["label"]
        uri = response[1]["recipe"]["uri"]
        image = response[1]["recipe"]["image"]
        recipe_source = response[1]["recipe"]["source"]
        recipe = Recipe.new(name, uri, image, recipe_source)
        recipes << recipe
      end
    else
      return "No recipes match '(search term)'"
    end

    return recipes
  end

  def self.getRecipe()
  end

end
