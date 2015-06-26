require 'pry'

class Person
	attr_accessor :name
end

james = Person.new
james.name = "James"

sum = '1'.to_i + '3'.to_i
binding.pry

puts sum

100.times do
	binding.pry
end