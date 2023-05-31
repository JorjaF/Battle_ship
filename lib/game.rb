class Game

    attr_reader :computer_board,
								:player_board

    def initialize
        @computer_board = Board.new
				@player_board = Board.new
    end

    def main_menu
        puts "Welcome to BATTLESHIP\n Enter p to play. Enter q to quit."
        user_input = gets.downcase.chomp
        if user_input == "p"
            puts "Game on"
				computer_setup	
				player_setup	
        elsif user_input == "q"
            puts "Goodbye"
        else
            puts "Invalid Input"        
        end
    end

		def computer_setup
			game = Game.new
			computer_board = Board.new			
			computer_cruiser = Ship.new("cruiser", 3)
			computer_submarine = Ship.new("submarine", 2)
			game.computer_place_ship(computer_cruiser)
			game.computer_place_ship(computer_submarine)
			puts game.computer_board.render(true)
			puts "I have laid my ships on the grid.\n"
			puts "You now need to lay out your ships.\n"
			puts "The Cruiser is 3 units long, and the Submarine is 2 units long.\n"
			
		end

    def computer_place_ship(ship)
        coordinates = []
        until @computer_board.valid_placement?(ship, coordinates)
            coordinates = []
            coordinates << @computer_board.cells.keys.sample
					until coordinates.length == ship.length
							coordinates << @computer_board.cells.keys.sample    
							coordinates.uniq!
					end
    		end

    @computer_board.place(ship, coordinates)
    return coordinates
		end 

		def player_setup
			puts @player_board.render(true)
			puts "Enter the squares for the Cruiser (3 spaces):"
			cruiser_input = gets.upcase.chomp
			player_place_cruiser(cruiser_input)
			# require 'pry'; binding.pry
		end

		def player_place_cruiser(coordinates)
			player_cruiser = Ship.new("cruiser", 3)
			ship_coordinates = coordinates.split
			if @player_board.valid_placement?(player_cruiser, ship_coordinates) == true
				@player_board.place(player_cruiser, ship_coordinates)
				puts @player_board.render(true)
			else 
					puts "Those are invalid coordinates, please try again"
							player_setup
			end
			 
		end


end