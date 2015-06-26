class FizzBuzz
	def initialize(conditions, lambda)
		@conditions = conditions
		@lambda
	end

	def run
		1.upto(100) do |i|
			print_result(i)
		end
	end

	def print_result(number)
		result = ""
		@conditions.each do |key, value|
			condition_result = @lambda.call(number, key, value)
		end
		
		if result == ""
			puts number
		else
			puts result
		end
	end

end

my_lambda -> (i, condition)
	if i % condition

conditions={
	3=>"Fizz"
	5=>"Buzz"
	7=>"Pro"
}
