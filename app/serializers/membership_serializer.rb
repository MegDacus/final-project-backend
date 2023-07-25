class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :is_host, :bookclub_id, :user_id, :bookclub_name

  def bookclub_name
    club = Bookclub.find_by(id: object.bookclub_id)
    club.name
  end

  belongs_to :user
end
