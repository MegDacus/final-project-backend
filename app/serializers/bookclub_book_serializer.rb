class BookclubBookSerializer < ActiveModel::Serializer
  attributes :id, :month

  belongs_to :book
end