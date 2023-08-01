class RemoveGenreIdFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :genre_id, :integer
    add_column :books, :genres, :string
  end
end
