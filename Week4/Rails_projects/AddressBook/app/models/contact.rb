	# Contact model

class Contact < ActiveRecord::Base
	has_attached_file :logo, styles: {:medium => "300x300>", :thumb => "100x100>"}
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
	has_many :entries
	
	validates :name, presence: true, uniqueness: true
	validates :address, presence: true

	# Helper to print Contact info.
	def to_s
		[address, primary_phone, secondary_phone, primary_email, secondary_email].compact.join(" - ")
	end

	def calculate_total_time
		total_hours = entries.where("created_at>?", 1.month.ago).sum(:hours)
		total_minutes = entries.where("created_at>?", 1.month.ago).sum(:minutes)

		while total_minutes > 59
			total_minutes -=60
			total_hours + 1
		end
		
		total_time = total_hours.to_s+":"+total_minutes.to_s

	end

end

