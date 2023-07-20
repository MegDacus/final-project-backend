class MembershipsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy]
    before_action :get_bookclub, only: [:index, :create]
   
    def index
        memberships = @bookclub.memberships.order(is_host: :desc)
        render json: memberships
    end

    def create
        if @bookclub.memberships.exists?(user_id: @current_user.id)
          render json: { error: "Membership already exists for the current user" }, status: :unprocessable_entity
        else
          membership = @bookclub.memberships.create!(user_id: @current_user.id, is_host: false)
          render json: membership, status: :created
        end
    end

    def destroy 
        membership = Membership.find_by!(id: params[:id])
        if membership_belongs_to_current_user?(membership)
            membership.delete 
            head :no_content
        else  
            render json: {error: "Unauthorized"}, status: :unauthorized
        end 
    end
    
    private
    
    def get_bookclub
        @bookclub = Bookclub.find_by(id: params[:bookclub_id])
    end

    def membership_belongs_to_current_user?(membership)
        membership.user_id == @current_user.id
    end
end
