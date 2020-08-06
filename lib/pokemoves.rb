require_relative "pokemon.rb"
require_relative "move.rb"
#require "pokemoves/cli/version"

  module Pokemoves
    class CLI
      
      def run
        puts "Welcome to Pokemoves!"
        input = 0
        until input == 3
          puts "Enter 1 to see a list of a pokemon's given moves."
          puts "Enter 2 to see if a certain move is learnable by a pokemon."
          puts "Enter 3 to exit."
          input = gets.to_i
          if input == 1
            get_pokemon_move_list

          elsif input == 2
            check_learnability_of_move
          else
            puts "That isn't a vailid choice." unless input == 3
          end

        end
        
      end
      
      def get_pokemon_move_list
        puts "Enter the name of a pokemon."
        pokemon_name = gets.chomp
        until Pokemon.find_or_create_by_name(pokemon_name.downcase) != nil
          puts "It doesn't look like we have that pokemon stored."
          puts "Try a different one."
          pokemon_name = gets.chomp
        end
        current_pokemon = Pokemon.find_or_create_by_name(pokemon_name.downcase)
        puts "Press enter to see a list of #{pokemon_name.capitalize}'s moves."
        gets
        counter = 1
        current_pokemon.get_moves.each{|move|
          puts "#{counter}. #{move.pretty_name}"
        counter += 1
        }
        puts "Enter the number of the move you'd like to know the type of."
        puts "To continue to the main menu, enter -1"
        num = gets.to_i
        until num <= 0
          if(num <= current_pokemon.get_moves.size)
            current_move = Move.find_or_create_by_name(current_pokemon.get_moves[num - 1].name)
            puts "The move #{current_move.pretty_name} is a #{current_move.type} type move."
          else
            puts "That number is not in the list of moves."
          end
          puts "Enter the number of the move you'd like to know the type of."
          puts "Enter -1 to continue to the main menu."
          num = gets.to_i
        end
      end
      
      def check_learnability_of_move
        puts "Enter the name of a move!"
        move_name = gets.chomp
        until Move.find_or_create_by_pretty_name(move_name) != nil
          puts "It doesn't look like we have that move stored."
          puts "Try a different one."
          move_name = gets.chomp
        end
        current_move = Move.find_or_create_by_pretty_name(move_name)
        puts "Enter the name of a pokemon to see if they can learn #{current_move.pretty_name}"
        pokemon_name = gets.chomp
        until Pokemon.find_or_create_by_name(pokemon_name.downcase) != nil
          puts "It doesn't look like we have that pokemon stored."
          puts "Try a different one."
          pokemon_name = gets.chomp
        end
        until pokemon_name == "exit"
          current_pokemon = Pokemon.find_or_create_by_name(pokemon_name.downcase)
          if current_pokemon.can_learn_move?(current_move)
            puts "It looks like #{current_pokemon.name.capitalize} can learn #{current_move.pretty_name}."
          else
            puts "It looks like #{current_pokemon.name.capitalize} can't learn #{current_move.pretty_name}."
          end
          puts "Enter the name of another pokemon to see if they can learn #{current_move.pretty_name}."
          puts "Enter \"exit\" to continue to the main menu."
          pokemon_name = gets.chomp
          until Pokemon.find_or_create_by_name(pokemon_name.downcase) != nil || pokemon_name == "exit"
            puts "It doesn't look like we have that pokemon stored."
            puts "Try a different one, or enter \"exit\" to exit."
            pokemon_name = gets.chomp
          end
        end
      end
      
    end
  
  end
