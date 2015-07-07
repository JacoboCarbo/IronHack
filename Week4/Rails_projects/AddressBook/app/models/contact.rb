# Contact model

class Contact < ActiveRecord::Base
	has_many :entries
	
	validates :name, presence: true, uniqueness: true
	validates :address, presence: true

	# Helper to print Contact info.
	def to_s
		[address, primary_phone, secondary_phone, primary_email, secondary_email].compact.join(" - ")
	end

end

