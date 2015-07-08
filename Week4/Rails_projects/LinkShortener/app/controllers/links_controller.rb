class LinksController < ApplicationController

	def new
		@link = Link.new()
	end

	def create
		@link = Link.new(link_params)
		@link.short_url = @link.reassign
		@link.visits ||= 0
		if @link.save
			redirect_to links_path, notice: "Short URL was succesfully created."
		else
			render :new
		end
	end

	def index
		@links = Link.order(created_at: :asc)
	end

	def top10
		@links = Link.order(visits: :asc).limit(2)
		render :index
	end

	def redirect
		link = Link.find_by(short_url: params[:short_url])
		link.update_attributes(visits: link.visits+1)
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
