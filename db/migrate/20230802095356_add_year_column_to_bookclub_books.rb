class AddYearColumnToBookclubBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookclub_books, :year, :integer
  end
end
