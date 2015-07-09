class Product < ActiveRecord::Base
	belongs_to :user
	has_many :bids

	has_attached_file :logo, styles: {:medium => "300x300>", :thumb => "100x100>"}
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	def highestBid
		if bids.any?
			bids.order(amount: :desc).first.amount
		else
			return 0
		end
	end

	
end
