class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.valid?
			@product.save
			redirect_to product_path(@product), notice: "Product was succesfully posted."
		else
			render :new
		end
	end

	def index
		@products = Product.order(created_at: :asc)
	end

	def search
		@products = Product.where("title LIKE ?","#{params[:product][:name]}%")
		render :index
	end

	def show
		@product = Product.find(params[:id])
	end

	def destroy
		Product.find(params[:id]).destroy
		redirect_to products_path
	end

	private
		def product_params
			params.require(:product).permit(:title, :description, :deadline, :logo)
		end
end