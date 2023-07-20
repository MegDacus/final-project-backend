class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :bookclubs, if: -> {should_include?(:bookclubs)}, serializer: BookShowSerializer do
    object.bookclubs.uniq
  end

  def should_include?(association)
    !instance_options[:exclude]&.include?(association.to_s)
  end
end

