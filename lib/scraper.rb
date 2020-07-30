require "httparty"
require "pry"

class Scraper
  
  def initialize
    response = HTTParty.get("https://pokeapi.co/api/v2/")
    binding.pry
  end
end

Scraper.new