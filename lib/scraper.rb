require "httparty"
require "pry"

class Scraper
  
  url = "https://pokeapi.co/api/v2/"
  @@pokemons = HTTParty.get(url + "/pokemon?offset=0&limit=964").parsed_response["results"]
  @@moves = HTTParty.get(url + "/move?offset=0&limit=746").parsed_response["results"]
  
  def self.get_pokemon_by_name(name)
    binding.pry
    @@pokemons.each{|pokemon|
      if pokemon["name"] == name
        return HTTParty.get(pokemon["url"])}
      end
    }
  end
  
  def self.pokemons
    @@pokemons.collect{|pokemon| pokemon["name"]}
  end
  
  def self.get_move_by_name(name)
    @@moves.each{|move|
      if move["name"] == name
        return HTTParty.get(move["url"])
      end
    }
  end
  
  def self.moves
    @@moves.collect{|pokemon| pokemon["name"]}
  end
  
end