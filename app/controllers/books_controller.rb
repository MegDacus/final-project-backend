class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authorize_user

    def index
        books = Book.all
        render json: books, exclude: ['bookclubs', 'discussion_questions']
    end

   def show
        book = Book.find_by(id: params[:id])
        render json: book
   end

   def create
     if is_admin?
        book = Book.create!(book_params)
        render json: book, status: :created
     else  
        render_error
     end
   end

   def destroy 
    if is_admin?
        book = Book.find_by!(id: params[:id])
        book.delete 
        head :no_content 
    else  
        render_error
    end
   end

   private

   def book_params 
    params.permit(:genre_id, :title, :author, :image_url)
   end

   def is_admin?
    @current_user[:is_admin] == true
   end

   def render_error 
    render json: { errors: ['Only admin have access to this action']}, status: :unprocessable_entity
   end
end
