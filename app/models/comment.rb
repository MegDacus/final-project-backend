class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :discussion_question

    validates :body, :user_id, :discussion_question_id, presence: true
    validates :body, length: { maximum: 500 }
end
