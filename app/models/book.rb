class Book < ApplicationRecord
    belongs_to :genre
    has_many :bookclub_books
    has_many :bookclubs, through: :bookclub_books

    validates :title, uniqueness: true
end
