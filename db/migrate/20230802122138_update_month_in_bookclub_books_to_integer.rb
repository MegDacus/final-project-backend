class UpdateMonthInBookclubBooksToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :bookclub_books, :month, :integer
  end
end
