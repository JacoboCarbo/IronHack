class Caesar


	def cipher(input, shift)
		@index = 0
		@my_array = []

		if shift == nil
			shift = 3
		end

		@my_array= input.split(//)
		@my_array.each do |i|
			if i == "a"
			end
			@my_array[@index] = (i.ord - shift).chr
			puts @my_array[@index]
			@index = @index+1
		end

	end

	def decipher
		@index = 0
		@my_array = []

		if shift == nil
			shift = -3
		end
	end
end

@encypted = cipher("Khoor", 6)
@decrypted = decipher(@encrypted, 6)