# SL3. The online calculator

# We are in the Internet era, so everything goes online. We order stuff online, we watch TV shows online, we buy music online, we even
# change the world through Twitter… so why not calculating online? Does it make sense? (Einstein silently agrees).

# Decided: we will implement a simple calculator so first grade students can use it from their iPhones while doing their exams. You will think:
# "but iOS and Android have a built-in calculator! Are you crazy?”. Well, it definitely has, but OURS IS ONLINE!!!

# So, our Online Calculator will:
# * Have a home page (‘/‘) where you see all four available operations: add, substract, multiply and divide. Pretty simple stuff.
# * For each one of the available operations, we will have a form with two input fields and a button, which will go to another URL/route and
# display the result, like “The multiplication of 4 and 15 is 60” or “The addition of 10 and 39 is 49".
# * There will also be a link, in the home page, that goes to ‘/counting’ and should display the numbers from 1 to 200, one number per line.

# Feel free to add more features! :D

require 'sinatra'
require 'sinatra/reloader'

class Calculator

	def calculate(operation, n1, n2)
		n1 = n1.to_i
		n2 = n2.to_i
		case operation
		when "+"
		result = n1 + n2
		when "-"
		result = n1 - n2
		when "*"
		result = n1 * n2
		when "÷"
		result = (n1/n2)
		end
	end
end

calculator = Calculator.new


get '/' do 

	erb :options
end


post '/calculate' do
	@operation = params[:operation]
	@n1 = params[:n1]
	@n2 = params[:n2]
	@result = calculator.calculate(@operation, @n1, @n2)

	erb :result
end




