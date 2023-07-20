class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :genre_id
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
