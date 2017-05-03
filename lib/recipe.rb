class Recipe
  attr_reader :name, :uri, :image, :recipe_source, :health_labels, :ingredient_lines

  def initialize(name, uri, image, recipe_source, health_labels, ingredient_lines)
    # raise ArgumentError if name == nil || name == "" || id == nil || id == ""
    @name = name
    @uri = URI.escape(uri)
    @image = image
    @recipe_source = recipe_source
    @health_labels = health_labels
    @ingredient_lines = ingredient_lines
  end

end
