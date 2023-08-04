class User < ApplicationRecord
    PASSWORD_FORMAT = /\A(?=.*[A-Za-z])(?=.*\d)(?!.*\s).{8,20}\z/


    has_secure_password
    
    has_many :memberships
    has_many :bookclubs, through: :memberships
    has_many :comments

    validates :username, :first_name, :last_name, :password, :password_confirmation,  presence: true
    validates :username, uniqueness: {message: ": This username is already taken."}
    validates :password, length: { minimum: 8, maximum: 20}, format: { with: PASSWORD_FORMAT, message: 'must be at least 8 characters and include at least one digit, one lowercase letter, one uppercase letter, and one special character'}

end
