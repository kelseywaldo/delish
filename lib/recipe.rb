class Recipe

  attr_reader :name, :uri, :image, :recipe_source, :health_labels, :ingredient_lines, :url

  def initialize(name, uri, image, options = {} )
    # raise ArgumentError if name == nil || name == "" || id == nil || id == ""
    @name = name
    @uri = URI.escape(uri)
    @image = image
    @recipe_source = options[:recipe_source]
    @health_labels = options[:health_labels]
    @ingredient_lines = options[:ingredient_lines]
    @url = options[:url]
  end

end
