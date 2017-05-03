require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  EDAMAM_KEY = ENV["EDAMAM_KEY"]
  EDAMAM_ID = ENV["EDAMAM_ID"]

  def self.getRecipeList(search_term)
    url = BASE_URL + "?app_id=#{EDAMAM_ID}" + "&app_key=#{EDAMAM_KEY}" + "&q=#{search_term}" + "&from=1&to=10" + "&returns=Hits&recipe=Recipe"

    response = HTTParty.get(url).parsed_response["hits"]
    # response = HTTParty.get(url).parsed_response["hits"][1]["recipe"]["label"]


    recipes = []

    if response == nil
      return "No recipes match '(search term)'"
    else
      response.each_with_index do | recipe, i |
        name = response[i]["recipe"]["label"]
        uri = response[i]["recipe"]["uri"]
        image = response[i]["recipe"]["image"]
        recipe_source = response[i]["recipe"]["source"]
        health_labels = response[i]["recipe"]["healthLabels"]

        # response[i]["healthLabels"].each do | healthlabel |
        #   health_labels << healthlabel
        # end

        recipe = Recipe.new(name, uri, image, recipe_source, health_labels)
        recipes << recipe
      end
    end

    return recipes
  end

  def self.getRecipe(uri)
    formatted_uri = URI.escape(uri)
    url = BASE_URL + "?r=#{formatted_uri}"
    response = HTTParty.get(url).parsed_response["hits"]
  end

end
