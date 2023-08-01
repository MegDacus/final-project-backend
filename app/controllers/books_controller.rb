class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        search_query = params[:search_query]
        type = params[:type]

        if search_query.present? && type.present?
            if type == "book"
                books = Book.where("title LIKE ? COLLATE NOCASE", "%#{search_query}%")
            elsif type == "author"
                books = Book.where("author LIKE ? COLLATE NOCASE", "%#{search_query}%")
            end
        else 
            books = Book.all
        end
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
    params.permit(:genres, :title, :author, :image_url, :summary)
   end

   def is_admin?
    @current_user[:is_admin]
   end

   def render_error 
    render json: { errors: ['Only admin have access to this action']}, status: :unprocessable_entity
   end
end
