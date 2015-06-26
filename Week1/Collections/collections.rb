fruits = {"bananas"=>4, "apples"=>7} # For strings
#OR
fruits2 = {bananas: 4, apples: 7} # For symbols instead of strings

fruits.each do |key, value|
	puts "We have #{value} #{key}"
end