my_lambda = lambda do |number, divisible, message|
		 			if number%divisible == 0
						return "#{message}"
					end
				end


array = (1..15)

array.each do |i|

	output = ""
	output += my_lambda{return}.call(i, 3, "Fizz")
	output += my_lambda{return}.call(i, 5, "Buzz")
	output += my_lambda{return}.call(i, 7, "Pro")

=begin
	if i % 5 == 0
		output += "Buzz"
	end


	if i % 7 == 0
		output += "Pro"
	end

=end

	if output == ""
		puts i
	else
		puts output
    end

end

		



