class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :memberships
  has_many :comments
end
