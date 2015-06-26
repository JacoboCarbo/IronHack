#Shopping Cart exercise
require 'date'


class Items
	attr_accessor :price

	def initialize(price)
		@price = price
	end
end

class Apples<Items
end

class Oranges<Items
end

class Grapes<Items
end

class Bananas<Items
end

class Watermelons<Items
end

class Cart

	def initialize()
		@today = Date.today #Use Date.new(2015,1,3), this was a saturday and can be used to check for the watermelon weekend discount
		@apple_count = 0
		@apple_discounts=0
		@number_items = 0
		@total = 0
		@total_items = []
	end

	def add_item(item)
		@total_items[@number_items] = item
		@number_items = @number_items+1
	end

	#calculate_total automatically detects when 2 apples are bought and applies 2x1 discount on apples.
	#calculate_total automatically detects watermelon sales on weekends and applies 10% discount on watermelons.
	def calculate_total
		@total_items.each do |element|
			if element.class==Apples
				@apple_count=@apple_count+1
				if @apple_count==2
					@apple_count=0
					@apple_discounts = @apple_discounts+1
				else
					@total = @total + element.price
				end

			elsif ((@today.wday==6 || @today.wday==0) && element.class==Watermelons)
				@total = @total + (element.price*0.9) #10% on watermelons on weekends
				@weekendWatermelon = true
				
			else
			@total = @total + element.price
			end


		end

		#Checks for Weekend Watermelon discount applied
		if @weekendWatermelon
			puts "10% discount on Watermelons on weekends!"
		end

		#Count number of 2x1's applied
		if (discountApple)>0
			puts "Congratulations! You received #{@apple_discounts} 2x1's on apples and saved #{@apple_discounts*10} euros!"
		end
		#Check for 10 euro discount
		if (discount100(@total))
			@total = @total-10
			puts "Congratulations! You received a 10 euro discount for buying more than 100 euros worth of fruit!"
		end

		#Check for 5% discount
		if (discount5)
			@total = @total*0.95
			puts "Congratulations! You received a 5% discount for buying more than 5 items!"
		end
		return @total
	end

	#DISCOUNTS - (2x1 on apples is applied directly through the calculate_total method)
	# If the cart has more than 5 items, return true, else return false
	def discount5
		if @number_items>=5
			return true
		else
			return false
		end
	end

	# If the toal to pay is greater than 100 euros, return true, esle return false
	def discount100(bill)
		if bill>100
			return true
		else
			return false
		end
	end

	def discountApple
		return @apple_discounts
	end

end

apples = Apples.new(10)
oranges = Oranges.new(5)
grapes = Grapes.new(15)
bananas = Bananas.new(20)
watermelons = Watermelons.new(50)
#puts oranges.price #returns 2
#puts bananas.price #returns 3

my_cart = Cart.new
my_cart.add_item(watermelons)
my_cart.add_item(watermelons)
my_cart.add_item(apples)
my_cart.add_item(apples)
my_cart.add_item(apples)
my_cart.add_item(apples)
my_cart.add_item(apples)

puts "Your total today is #{my_cart.calculate_total} euros"
