require "httparty"
require "pry"

class Scraper
  
  attr_reader :url :pokemon :moves
  
  def initialize
    @url = "https://pokeapi.co/api/v2/"
  end
  
  def scrape_pokemon()
    pokemon_url_list = HTTParty.get(url + "/pokemon?offset=0&limit=964")
    pokemon_url_list.parsed_response
    @pokemon = pokemon_url_list
  end
  
end

Scraper.new.scrape_pokemon