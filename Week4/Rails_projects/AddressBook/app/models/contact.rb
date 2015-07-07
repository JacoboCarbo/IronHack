class Contact < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :address, presence: true

	# Helper to print Project info.
	def to_s
		[address, primary_phone, secondary_phone, primary_email, secondary_email].compact.join(" - ")
	end

end

