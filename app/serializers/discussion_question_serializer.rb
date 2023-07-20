class DiscussionQuestionSerializer < ActiveModel::Serializer
  attributes :id, :body

  has_many :comments
end
