class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :destroy]
    before_action :set_question, only: [:index, :create]
    before_action :set_comment, only: [:show, :destroy]

    def index
        comments = @question.comments
        render json: comments
    end

    def create
        comment = @question.comments.create!(user_id: @current_user.id, body: params[:body])
        render json: comment, status: :created
    end

    def show
        render json: @comment
    end

    def destroy
        if @comment[:user_id] == @current_user.id
            @comment.destroy 
            head :no_content
        else  
            render json: {error: "You are unauthorized to delete comments made by a different user"}, status: :unauthorized
        end
    end

    private 

    def set_comment 
        @comment = Comment.find_by(id: params[:id])
    end

    def set_question 
        @question = DiscussionQuestion.find_by(id: params[:discussion_question_id])
    end
end
