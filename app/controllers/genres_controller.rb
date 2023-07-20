class GenresController < ApplicationController

    def index
        genres = Genre.all 
        render json: genres, exclude: ['bookclubs']
    end

    def show
        genre = Genre.find_by(id: params[:id])
        render json: genre
    end

end
