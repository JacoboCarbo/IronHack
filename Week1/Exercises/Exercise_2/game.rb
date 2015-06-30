require 'pry'


#
class Player

	attr_accessor :name, :inventory

	def initialize(name, inventory)
		@name = name
		@inventory = inventory
	end

end

#
class Inventory
	attr_accessor :items
	def initialize
		@items = []
	end

	def add_item(item)
		items << item
		puts "You picked up a #{item}"
	end

	def drop_item(item)
		delete.if do |i| i==item end
	end
end


#
class Room

	attr_accessor :description, :hint, :sight, :item, :contiguous_rooms

	def initialize (description, hint, sight, item)
		@description = description
		@hint = hint
		@sight = sight
		@item = item
		@contiguous_rooms = {}
	end

	def add_neighbour(direction, room)
		@contiguous_rooms[direction] = room		
	end

	def print_info
		puts "\n ---------------------------------------"
		p self.description + " " + self.hint
		print " Exits: "
		contiguous_rooms.keys.each do |i|
			print "  "+i+ "  "
		end
		puts "\n"
	end

	def look_around
		p self.sight
	end

end


class Locked_room < Room

	def special_action
		puts "You opened the door!\n"
	end
end


#
class Game
	def initialize(player, world, initial_room)
		@player = player
		@world = world
		@location = initial_room
		@status = true
	end

	def run
		initial_message
		while @status do
			@location.print_info
			interpret_command(prompt_command)
			if @location.description==" "
				@status = false
			end
		end
	p "-"*10 + "   THE END   " + "-"*10	
	end

	def initial_message
		p " Move around the map with the direction keys: 'n', 's', 'e', 'w'"
		p " Press 'q' to quit game"
		puts " Good luck, and don't die...\n\n"
	end

	def prompt_command
		print "–> "
		command = gets.chomp
		puts "\n"
		return command
	end

	def interpret_command(command)
		if command == "q" # Quit game command
			@player.status = nil

		elsif next_room = @location.contiguous_rooms[command]
			@location = next_room
		elsif command == "look around"
			@location.look_around
		elsif command == "pick up"
			@player.inventory.add_item(@location.item)
		elsif command[0,4] == "drop"
			@player.inventory.drop_item(command[4,-1])
		elsif command == "open door" && @location.description == "There is a locked door."
			@location.special_action
		else
			p "Sorry, no such command exits... Try again"
		end
	end

	def win_game
		puts "Congratulations! You escaped!"
		@status = nil
	end

end


# Main

start_room = Room.new("Where should I go now?", " This is a hint", "You can't see anything...", nil)
key_room = Room.new("I can see something shiny in that corner...", " This is a hint", "You can't see anything...", "KEY")
dark_room = Room.new("This room is extremely dark...", " This is a hint", "You can't see anything...", nil)
locked_room = Locked_room.new("There is a locked door.", " This is a hint", "You can't see anything...", "RED BULL")
oxi_room = Room.new("There is a ladder on the ceiling in the N direction.", " This is a hint", "You can't see anything...", nil)
win_room = Room.new(" ", "", " You can't see anything...", "")

start_room.add_neighbour("N", oxi_room)
start_room.add_neighbour("E", dark_room)
start_room.add_neighbour("W", key_room)

key_room.add_neighbour("E", start_room)

dark_room.add_neighbour("N", locked_room)
dark_room.add_neighbour("W", start_room)

locked_room.add_neighbour("S", dark_room)
locked_room.add_neighbour("W", oxi_room)
locked_room.add_neighbour("E", win_room)

oxi_room.add_neighbour("S", start_room)
oxi_room.add_neighbour("E", locked_room)

win_room.add_neighbour("E", oxi_room)



world = [start_room, key_room, dark_room, locked_room, oxi_room, win_room]

inventory = Inventory.new
player = Player.new("Jacobo", inventory)


game = Game.new(player, world, start_room)


game.run







