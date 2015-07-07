class Link < ActiveRecord::Base
	validates :url, presence: true
	validates :short_url, presence: true

	def generator(number)
		o = [('a'..'z'), (0..9), ('A'..'Z')].map { |i| i.to_a }.flatten
		string = (0...number).map { o[rand(o.length)] }.join
	end

	def reassign
		short_url = "http://short/#{generator(3)}"
	end

	def retrieve_url
		"http://#{url}"
	end
end
