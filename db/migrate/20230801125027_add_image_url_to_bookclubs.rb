class AddImageUrlToBookclubs < ActiveRecord::Migration[7.0]
  def change
    add_column :bookclubs, :image_url, :string
  end
end
