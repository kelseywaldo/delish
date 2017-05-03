class Recipe
  attr_reader :name, :uri, :image, :recipe_source, :health_labels

  def initialize(name, uri, image, recipe_source, health_labels)
    # raise ArgumentError if name == nil || name == "" || id == nil || id == ""
    @name = name
    @uri = uri
    @image = image
    @recipe_source = recipe_source
    @health_labels = health_labels
  end

end
