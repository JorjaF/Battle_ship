class Game

    attr_reader :computer_board

    def initialize
        @computer_board = Board.new
    end

    def main_menu
        puts "Welcome to BATTLESHIP\n Enter p to play. Enter q to quit."
        user_input = gets.chomp
        if user_input == "p"
            puts "Game on"
				computer_setup		
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
end