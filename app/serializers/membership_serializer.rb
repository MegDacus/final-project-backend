class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :is_host

  belongs_to :user
end
