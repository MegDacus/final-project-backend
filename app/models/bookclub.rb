class Bookclub < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :bookclub_books
    has_many :books, through: :bookclub_books
    has_many :discussion_questions

    # validates :host_user_id, presence: true
    validates :name, uniqueness: true, presence: true
    validates :description, presence: true
end
