
class BidsController < ApplicationController
		def new
			@product = Product.find(params[:product_id])
			@bid = @product.bids.new
		end

		def create
			@product = Product.find(params[:product_id])
			@bid = @product.bids.new(bid_params)
			if @bid.valid?
				@bid.save
			redirect_to product_path(@product), notice: "Bid was succesfully posted."
			else
				render :new
			end
		end

		private

		def bid_params
			params.require(:bid).permit(:amount)
		end
end
