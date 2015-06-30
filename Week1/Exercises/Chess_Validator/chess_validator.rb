require './chess.rb'

class ChessValidator

	def initialize
		@board = Board.new
		@wR1 = Rook.new("w")
		@wR2 = Rook.new("w")
		@knight1 = Knight.new("w")
		@knight2 = Knight.new("w")
		@bishop1 = Bishop.new("w")
		@bishop2 = Bishop.new("w")
		@queen = Queen.new("w")
		@king = King.new("w")
		@pawn1 = Pawn.new("w")
		@pawn2 = Pawn.new("w")
		@pawn3 = Pawn.new("w")
		@pawn4 = Pawn.new("w")
		@pawn5 = Pawn.new("w")
		@pawn6 = Pawn.new("w")
		@pawn7 = Pawn.new("w")
		@pawn8 = Pawn.new("w")

		@knight1 = Knight.new("b")
		@knight2 = Knight.new("b")
		@bishop1 = Bishop.new("b")
		@bishop2 = Bishop.new("b")
		@queen = Queen.new("b")
		@king = King.new("b")
		@pawn1 = Pawn.new("b")
		@pawn2 = Pawn.new("b")
		@pawn3 = Pawn.new("b")
		@pawn4 = Pawn.new("b")
		@pawn5 = Pawn.new("b")
		@pawn6 = Pawn.new("b")
		@pawn7 = Pawn.new("b")
		@pawn8 = Pawn.new("b")

		# Add all pieces to the board
	end
=begin
	def read_file
		moves = IO.readlines('simple_tests.txt')
		moves.each
 	end
=end
end

#--------------------------------------------#
# Main

chess_validator = ChessValidator.new
chess_validator.