class DiscussionQuestionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy]
    before_action :set_bookclub, only: [:index, :create]
    before_action :set_question, only: [:show, :destroy]


    def index
        questions = @bookclub.discussion_questions 
        render json: questions, include: ['comments.user']
    end

    def create
        if is_host? 
            question = @bookclub.discussion_questions.create!(question_params)
            render json: question, status: :created 
        else  
            render_error
        end
    end

    def show
        render json: @question
    end

    def destroy
        if is_host?
            @question.comments.destroy_all
            @question.destroy 
            head :no_content 
        else  
            render_error
        end
    end

    private

    def question_params
        params.permit(:body)
    end

    def set_question 
        @question = DiscussionQuestion.find_by!(id: params[:id])
    end

    def set_bookclub 
        @bookclub = Bookclub.find_by!(id: params[:bookclub_id])
    end

    def is_host?
        Membership.exists?(bookclub_id: params[:bookclub_id], user_id: @current_user.id, is_host: true)
    end

    def render_error
        render json: {errors: ['Only the host is authorized for this action']}, status: :unauthorized
    end
end
