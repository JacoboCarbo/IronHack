require 'pry'
#
#
class ChessValidator
	def initializar(board)

	end
end

class Board
	def initialize
		@board = [[nil, nil, nil, nil, nil, nil, nil, nil],
				  [nil, nil, nil, nil, nil, nil, nil, nil],
				  [nil, nil, nil, nil, nil, nil, nil, nil],
				  [nil, nil, nil, nil, nil, nil, nil, nil],
				  [nil, nil, nil, nil, nil, nil, nil, nil],
				  [nil, nil, nil, nil, nil, nil, nil, nil],
				  [nil, nil, nil, nil, nil, nil, nil, nil],
				  [nil, nil, nil, nil, nil, nil, nil, nil]
				 ]
	end

	# Adds a piece to the board at the given position.
	def add_piece(piece, position)
		if occupant = (check_position(position)) == nil
			@board[position[0]][position[1]] = piece
			puts "#{piece.class} added to position #{position}"
		else
			puts "Position #{position} is already taken by #{occupant}"
		end
	end

	# Deletes a piece from the board at a given position.
	def delete_piece(position)
		if occupant = check_position(position)
			@board[position[0]][position[1]] = nil
			puts "#{occupant} deleted from position #{position}! "
		else
			puts "Position #{position} was already empty!"
		end
	end

	# Returns whatever is at the given position. Either a piece or nil.
	def check_position(position)
		piece = @board[position[0]][position[1]]
		if piece == nil
			puts "Position #{position} is empty"
		else
			puts "Position #{position} holds a #{piece}"
		end
		return piece
	end

	# This method evaluates all cells between to origin and the destination. Returns true if the way is clear, false otherwise.
	def check_path(board, origin, destination, direction)

		if direction == "L"
			return true
		end

		row_travel = destination[0]-origin[0]
		col_travel = destination[1]-origin[1]
		iterations = ([row_travel.abs, col_travel.abs].max)-1

		if row_travel > 0
			row_travel = 1
		elsif row_travel < 0
			row_travel = -1
		else
			row_travel = 0
		end

		if col_travel > 0
			col_travel = 1
		elsif col_travel < 0
			col_travel = -1
		else
			col_travel = 0
		end

		path = []
		path_cell = origin
		iterations.times do |i|
			path_cell[0] += row_travel
			path_cell[1] += col_travel
			path << board.check_position(path_cell)
		end

		return path.all? {|cell| cell == nil}
	end
end


#
class Piece
	attr_accessor :team, :valid_directions

	def initialize(team)
		@team = team
		@valid_directions = []
	end

	# This method evaluates the validity of a move by evaluating the destination, the path, and the type of move(horizontal, diagonal etc...).
	def validate_move(board, origin, destination)

		piece_at_origin = board.check_position(origin)
		piece_at_destination = board.check_position(destination)
		direction = check_direction(origin, destination)
		
		if self.class = King
			if 
		if check_destination(piece_at_destination) && @valid_directions.include?(direction) && board.check_path(board, origin, destination, direction)
			return "LEGAL"
		else
			return "ILLEGAL"
		end
	end

	# Evaluates the destination coordinates. Returns true if destination is empty or contains an enemy.
	def check_destination(piece_at_destination)
		if piece_at_destination == nil || piece_at_destination.team != self.team
			return true
		else
			return nil
		end
	end

	# Calculates the type of move. "V": Vertical, "H": Horizontal, "D": Diagonal, "L": Horse Leap
	def check_direction(origin, destination)
		if origin[0] == destination[0]
			return "V"
		elsif origin[1] == destination[1]
			return "H"
		elsif (origin[0]-destination[0]).abs == (origin[1]-destination[1]).abs
			return "D"
		elsif ((origin[0]-destination[0]).abs == 2 && (origin[1]-destination[1]).abs == 1) || ((origin[0]-destination[0]).abs == 1 && (origin[1]-destination[1]).abs == 2)
			return "L"
		end
	end
end

class Pawn < Piece
	def initialize(team)
		super
		@valid_directions = ["V", "D"]
	end
end

class Rook < Piece
	def initialize(team)
		super
		@valid_directions = ["H", "V"]
	end
end

class Knight < Piece
	def initialize(team)
		super
		@valid_directions = ["L"]
	end
end

class Bishop < Piece
	def initialize(team)
		super
		@valid_directions = ["D"]
	end
end

class Queen < Piece
	def initialize(team)
		super
		@valid_directions = ["H", "V", "D"]
	end
end

class King < Piece
	def initialize(team)
		super
		@valid_directions = ["H", "V", "D"]
	end
end


#-------------------------------------------#
# Main

board = Board.new
wR1 = Rook.new("w")
wR2 = Rook.new("b")
knight1 = Knight.new("w")
knight2 = Knight.new("b")
bishop1 = Bishop.new("w")
bishop2 = Bishop.new("b")
queen = Queen.new("w")
king = King.new("w")

board.add_piece(queen, [3,3])
board.add_piece(bishop2, [5,5])

puts queen.validate_move(board, [3,3], [2,4])


