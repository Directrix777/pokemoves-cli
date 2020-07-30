require "httparty"
require "pry"

class Scraper
  
  attr_reader :url
  
  def initialize
    @url = "https://pokeapi.co/api/v2/"
  end
  
  def scrape_pokemon()
    pokemon_url_list = HTTParty.get(url + "/pokemon?offset=0&limit=964")
    pokemon_url_list.parsed_response
    pokemon_list = []
    pokemon_url_list["results"].each{|pokemon_url|
      pokemon_list << HTTParty.get(pokemon_url[url]).parsed_response
    }
    binding.pry
  end
  
end

Scraper.new.scrape_pokemon