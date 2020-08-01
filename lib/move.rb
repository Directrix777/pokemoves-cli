require_relative "scraper.rb"
require_relative "pokemon.rb"

class Move
  attr_reader :name, :pretty_name
  @@all = []
  
  def initialize(name)
    @name = name
    @pretty_name = name.split("-").collect{|word| word.capitalize}.join(" ")
    
    @@all << self
  end
  
  def type
    if @type == nil
      @type = Scraper.get_move_by_name(name)["type"]["name"]
    end
    @type
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
  
  def self.find_or_create_by_pretty_name(pretty_name)
    self.find_or_create_by_name(pretty_name.split(" ").collect{|word| word.downcase}.join("-"))
  end
end
