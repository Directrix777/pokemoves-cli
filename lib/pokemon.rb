require_relative "./scraper.rb"

class Pokemon
  attr_reader :name, :type
  @@all = []
  
  def initialize(name)
    @name = name
    @type = Scraper.get_pokemon_by_name(name)["types"][0]["name"]
    binding pry
  end
end

Pokemon.new("sylveon")