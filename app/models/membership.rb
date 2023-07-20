class Membership < ApplicationRecord
    belongs_to :user
    belongs_to :bookclub

    validates :user_id, :bookclub_id, presence: true
    validates :is_host, inclusion: {in: [true, false]}
end
