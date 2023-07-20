class BookclubBooksController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def create
        if is_host?
             book = BookclubBook.create!(club_book_params.merge(bookclub_id: params[:bookclub_id]))
            render json: book, status: :created
        else
            render json: {error: "Only the host is authorized for this action"}, status: :unauthorized
        end
    end

    def index
        club_books = BookclubBook.where(bookclub_id: params[:bookclub_id])
        render json: club_books
    end

    private

    def club_book_params
        params.permit(:book_id, :month)
    end

    def is_host?
        Membership.exists?(bookclub_id: params[:bookclub_id], user_id: @current_user.id, is_host: true)
    end
end
