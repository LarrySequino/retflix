class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def edit
        @movie = get_movie
    end

    def show
        @movie = get_movie
    end

    def update
        @movie = get_movie
        updated_movie = params[:movie]
        if @movie.update_attributes(
            :title => updated_movie[:title], 
            :description => updated_movie[:description], 
            :year_released => updated_movie[:year_released])

            redirect_to "/movies/show/#{params[:id]}"
        else
           render :edit, :id=> params[:id]
        end
    end

    def search
        @movie = Movie.new
    end

    def results
        @query = params[:query]

        @movies = Movie.where("title LIKE ? OR description LIKE ? OR year_released LIKE ?", "%#{@query}%",  "%#{@query}%",  "%#{@query}%")

    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to "/movies/show/#{@movie.id}"
        else
            render :new
        end
    end

    private
        def get_movie
            movie = Movie.find(params[:id])

            rescue ActiveRecord::RecordNotFound
            redirect_to "/movies"

            return movie
        end

        def movie_params
            params.require(:movie).permit(
                :title,
                :description,
                :year_released)
        end
end