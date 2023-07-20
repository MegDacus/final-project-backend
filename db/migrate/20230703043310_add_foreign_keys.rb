class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :bookclub_books, :bookclubs
    add_foreign_key :bookclub_books, :books
    add_foreign_key :memberships, :users
    add_foreign_key :memberships, :bookclubs
    add_foreign_key :comments, :users
    add_foreign_key :comments, :discussion_questions
  end
end
