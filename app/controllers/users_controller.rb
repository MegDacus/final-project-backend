class UsersController < ApplicationController
    skip_before_action :authorize_user, only: [:create]
    skip_before_action :verify_authenticity_token

    def index
        if @current_user[:is_admin] 
            users = User.all 
            render json: users, status: :ok
        else
            render json: {error: "This page is for admin only"}, status: :unauthorized
        end
    end

    def create
        user = User.create!(user_params)
        user[:is_admin] = false
        user.save
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def admin_create
        if @current_user[:is_admin] 
            user = User.create!(user_params)
            user[:is_admin] = true
            user.save
            render json: user, status: :created
        else  
            render json: {error: "Only admin can create new admin users"}
        end
    end

    def show
        render json: @current_user, status: :ok
    end

    def save_image
        base64_string = params[:base64_string]
        cleaned_base64_string = base64_string.sub(/\Adata:([-\w]+\/[-\w]+);base64,/, '')
        decoded_image = Base64.decode64(cleaned_base64_string)

        file_path = Rails.root.join('app', 'assets', 'images', 'profile'+@current_user.id.to_s()+'.png' )
        @current_user.profile_pic = file_path.to_s;

        File.open(file_path, 'wb') do |file|
            file.write(decoded_image)
        end

        render json: {message: "Image saved successfully."}
    end

    def get_image
        profile_id = params[:id]

        file_path = Rails.root.join('app', 'assets', 'images', 'profile'+profile_id.to_s()+'.png' )

        image_data = File.read(file_path)

        base64_data = Base64.encode64(image_data)

    # Send the base64 image data as a response
        render json: { image_data: base64_data }
    end

    private

    def user_params
        params.permit(:username, :first_name, :last_name, :password, :password_confirmation)
    end
end
