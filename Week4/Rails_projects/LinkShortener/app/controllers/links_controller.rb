class LinksController < ApplicationController

	def new
		@link = Link.new()
	end

	def create
		@link = Link.new(link_params)
		@link.short_url = @link.reassign
		if @link.save
			redirect_to links_path, notice: "Short URL was succesfully created."
		else
			render :new
		end
	end

	def index
		@links = Link.order(created_at: :asc)
	end

	def redirect
		link = Link.find_by(short_url: params[:short_url])
		redirect_to link.retrieve_url
	end

	 def destroy
		Link.find(params[:id]).destroy
		redirect_to links_path
	end



	private
		def link_params
			params.require(:link).permit(:url)
		end

end
