class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :bookclub_id
      t.boolean :is_host

      t.timestamps
    end
  end
end
