class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :image_url, :summary, :genres, :this_months_clubs
  
  
  def this_months_clubs  
    object.bookclubs.filter do |club|
      bookclub_book = BookclubBook.where(month: Time.now.month, bookclub_id: club.id).first
      book = Book.find_by(id: bookclub_book&.book_id)
      book.id == object.id
    end
  end
  
  def should_include?(association)
    !instance_options[:exclude]&.include?(association.to_s)
  end
  
  has_many :bookclubs, serializer: BookShowSerializer, if: -> { should_include?(:bookclubs) } 
end
