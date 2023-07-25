class ApplicationController < ActionController::Base
    include ActionController::Cookies
    protect_from_forgery with: :exception

    rescue_from ActiveRecord::RecordInvalid, with: :invalid_error_response
    rescue_from ActiveRecord::RecordNotFound, with: :no_record_found_response
    before_action :authorize_user

    private

    def invalid_error_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

    def no_record_found_response
        render json: {errors: ["No record found with matching parameters"] }, status: :not_found
    end

    def authorize_user
        @current_user = User.find_by(id: session[:user_id])
        render json: {errors:["Not authorized"]}, status: :unauthorized unless @current_user 
    end
end
