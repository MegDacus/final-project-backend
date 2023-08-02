class BookclubSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :this_months_book, :previous_books, :host, :image_url

  def this_months_book
    bookclub_book = BookclubBook.where(month: current_month, bookclub_id: object.id).first
    book = Book.find_by(id: bookclub_book&.book_id)
    if book 
      serialize_book(book)
    end
  end

  has_many :discussion_questions do
    object.discussion_questions
  end
  
  def previous_books
    current_month = Date.today.month
    current_year = Date.today.year
  
    books_array = object.bookclub_books.where('year < ? OR (year = ? AND month < ?)', current_year, current_year, current_month)
  
    books_array.map do |bookclub_book|
      book = Book.find_by(id: bookclub_book.book_id)
      serialize_book(book)
    end
  end

  def host
    host = User.find_by(id: object.host_user_id)
    host_info = {
      "id": host.id,
      "username": host.username
    }
    host_info
  end

  private 

  def current_month 
    Time.now.month
  end

  def serialize_book(book)
    { "id": book.id,
      "title": book.title,
      "author": book.author,
      "image_url": book.image_url,
      "summary": book.summary,
      "genres": book.genres
     }
  end

end
