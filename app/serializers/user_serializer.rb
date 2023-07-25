class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :is_admin

  has_many :memberships
  has_many :bookclubs
  has_many :comments
end
