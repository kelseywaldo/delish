class Recipe
  attr_reader :name, :uri, :image, :recipe_source

  def initialize(name, uri, image, recipe_source)
    # raise ArgumentError if name == nil || name == "" || id == nil || id == ""
    @name = name
    @uri = uri
    @image = image
    @recipe_source = recipe_source
  end

end
