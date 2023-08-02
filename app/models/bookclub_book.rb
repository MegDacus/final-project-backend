class BookclubBook < ApplicationRecord
    belongs_to :bookclub
    belongs_to :book

    validates :bookclub_id, :book_id, presence: true
end
