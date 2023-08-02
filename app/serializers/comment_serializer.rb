class CommentSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :body, :created_ago
  belongs_to :user

  def created_ago
    time_ago_in_words(object.created_at) + ' ago'
  end
end
