require "httparty"
require "pry"

class Scraper
  
  url = "https://pokeapi.co/api/v2/"
  @@pokemon = []
  
  def self.scrape_pokemon()
    pokemon_url_list = HTTParty.get(url + "/pokemon?offset=0&limit=964")
    pokemon_url_list.parsed_response
    @@pokemon = pokemon_url_list
  end
  
  def self.get_pokemon_by_name(name)
    @@pokemon.each{|pokemon|
      if pokemon["name"] == name
        return HTTParty.get(pokemon["url"])
      end
    }
  end
  
  
  
end

Scraper.scrape_pokemon