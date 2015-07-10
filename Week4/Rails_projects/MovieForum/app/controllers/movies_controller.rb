class MoviesController < ApplicationController

	def search
		@movies = Movie.where("title LIKE ?","#{params[:movie][:title]}%")
		if @movies.valid?
			render :index
		else
			#search in IMDB etc
		end
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.valid?
			@movie.save
			redirect_to movie_path(@movie), notice: "Movie was succesfully indexed."
		else
			render :new
		end
	end

	def index
		@movies = Movie.order(title: :asc)
	end

	def show
		@movie = Movie.find(params[:id])
	end

	private
	def movie_params
		params.require(:movie).permit(:title, :year, :synopsis)
	end


end
