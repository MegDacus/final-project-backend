class BookclubSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :this_months_book, :previous_books

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
      books_array = object.bookclub_books.where.not(month: current_month)
      books_array.map do |bookclub_book| 
        book = Book.find_by(id: bookclub_book.book_id)
        serialize_book(book)
      end 
  end

  private 

  def current_month 
    Time.now.strftime('%B')
  end

  def serialize_book(book)
    { "id": book.id,
      "title": book.title,
      "author": book.author}
  end

end
