class User < ApplicationRecord
    has_secure_password
    
    has_many :memberships
    has_many :bookclubs, through: :memberships
    has_many :comments

    validates :username, :first_name, :last_name, :password, :password_confirmation,  presence: true
    validates :username, uniqueness: {message: ": This username is already taken."}
end
