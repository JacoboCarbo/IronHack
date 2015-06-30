require 'date'

class Post

	def initialize(title, text, sponsor)
		 
		@title = title
		@date = Date.today
		@text = text
		@sponsor = sponsor
	end

	def get_title
		@title
	end

	def get_date
		@date
	end

	def get_text
		@text
	end

	def get_sponsor
		@sponsor
	end

end
