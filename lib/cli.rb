require_relative "pokemon.rb"
require_relative "move.rb"

class CLI
  puts "Welcome to Pokemoves!"
  input = 0
  until input == 3
    puts "Enter 1 to see a list of a pokemon's given moves."
    puts "Enter 2 to see if a certain move is learnable by a pokemon."
    puts "Enter 3 to exit."
    input = gets.to_i
    if input == 1
      puts "Enter the name of a pokemon!"
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
        puts "#{counter}. #{move.capitalize.split("-").join(" ")}"
        counter += 1
      }
      puts "Enter the number of the move you'd like to know the type of."
      puts "To continue to the main menu, enter -1"
      num = gets.to_i
      until num <= 0
        if(num <= current_pokemon.get_moves.size)
          current_move = Move.find_or_create_by_name(current_pokemon.get_moves[num - 1])
          puts "The move #{current_move.name.capitalize} is a #{current_move.type} type move."
        else
          puts "That number is not in the list of moves"
        end
        puts "Enter the number of the move you'd like to know the type of."
        puts "To continue to the main menu, enter -1"
        num = gets.to_i
      end
      
    end
    
  end
  
end
