require_relative "scraper.rb"

class Pokemon
  attr_reader :name, :type
  @@all = []
  
  def initialize(name)
    @name = name
    @type = Scraper.get_pokemon_by_name(name)["types"][0]["type"]["name"]
    @@all << self
    binding.pry
  end
  
  def self.all
    @@all
  end
  
  def self.find_or_create_by_name(name)
    if Scraper.pokemons.include?(name)
      return self.all.detect{|a| a.name == name} if self.all.collect{|a| a.name}.include?(name)
      return Pokemon.new(name)
    end
    return nil
  end
end