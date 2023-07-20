class DiscussionQuestion < ApplicationRecord
    belongs_to :bookclub
    has_many :comments
    has_many :users, through: :comments

    validates :bookclub_id, :body, presence: true
end
