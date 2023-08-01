class BookclubsController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authorize_user

    def index
        search_query = params[:search_query]
        type = params[:type]

        if search_query.present? && type == 'club'
            clubs = Bookclub.where("name LIKE ? COLLATE NOCASE", "%#{search_query}%")
        elsif search_query.present? && type == 'genre'
            clubs = Bookclub.joins(:books).where("books.genres LIKE ? COLLATE NOCASE", "%#{search_query}%").distinct
        else
            clubs = Bookclub.all
        end

        render json: clubs, each_serializer: BookclubIndexSerializer
    end

    def create
        club = Bookclub.create!(bookclub_params)
        Membership.create!(user_id: params[:host_user_id], bookclub_id: club.id, is_host: true)
        render json: club, status: :created
    end

    def show
        club = Bookclub.find_by!(id: params[:id])
        render json: club, include: ['this_months_book','discussion_questions','previous_books']
    end

    def update
        puts 'TEST TESt TEST'
        club = Bookclub.find_by!(id: params[:id])
        
        club.update(bookclub_params)
        render json: { message: "Bookclub updated successfully" }
    end

    def destroy 
       club = Bookclub.find_by!(id: params[:id])
       membership = Membership.find_by!(bookclub_id: club.id, user_id: @current_user.id, is_host: true)
       
       if membership
            membership.delete
            club.delete
            head :no_content
       else
            render json: {error: "Only the host is authorized to delete the bookclub"}, status: :unprocessable_entity
       end 
    end

    private

    def bookclub_params
        params.permit(:name, :description, :host_user_id, :image_url)
    end
 
end
