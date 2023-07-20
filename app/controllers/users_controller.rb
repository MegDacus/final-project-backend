class UsersController < ApplicationController
    skip_before_action :authorize_user

    def index
        if @current_user[:is_admin] 
            users = User.all 
            render json: users, status: :ok
        else
            render json: {error: "This page is for admin only"}, status: :unauthorized
        end
    end

    def create
        user = User.create!(user_params.merge(is_admin: false))
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show
        render json: @current_user, status: :ok
    end

    private

    def user_params
        params.permit(:username, :first_name, :last_name, :password, :password_confirmation)
    end
end
