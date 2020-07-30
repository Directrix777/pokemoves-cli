require "httparty"
require "pry"

class Scraper
  
  url = "https://pokeapi.co/api/v2/"
  pokemons = HTTParty.get(url + "/pokemon?offset=0&limit=964").parsed_response
  moves = HTTParty.get(url + "move?offset=0&limit=746").parsed_response
  
  def self.get_pokemon_by_name(name)
    pokemons.each{|pokemon|
      if pokemon["name"] == name
        return HTTParty.get(pokemon["url"])
      end
    }
  end
  
  
  
end

Scraper.scrape_pokemon