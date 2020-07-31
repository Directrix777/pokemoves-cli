require_relative "scraper.rb"
require_relative "pokemon.rb"

class Move
  attr_reader :name, :type
  @@all = []
  
  def initialize(name)
    @name = name
    @type = Scraper.get_move_by_name(name)["type"]["name"]
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find_or_create_by_name(name)
    if Scraper.moves.include?(name)
      return self.all.detect{|a| a.name == name} if self.all.collect{|a| a.name}.include?(name)
      return Move.new(name)
    end
    return nil
  end
end
