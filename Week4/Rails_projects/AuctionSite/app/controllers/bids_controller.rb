
class BidsController < ApplicationController
		def new
			@product = Product.find(params[:product_id])
			@bid = @product.bids.new
		end

		def create
			@product = Product.find(params[:product_id])

			@user = User.find_by(email: params[:user_email])

			@bid = @product.bids.new(amount: params[:amount], user_id: @user.id)

			if @bid.valid?
				@bid.save
				redirect_to product_path(@product), notice: "Bid was succesfully posted."
			else
				render :new
			end
		end

		private

end
