class CreateBookclubBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookclub_books do |t|
      t.integer :bookclub_id
      t.integer :book_id
      t.string :month

      t.timestamps
    end
  end
end
