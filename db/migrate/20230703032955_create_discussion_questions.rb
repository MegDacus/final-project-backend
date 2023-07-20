class CreateDiscussionQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :discussion_questions do |t|
      t.integer :book_id
      t.string :body

      t.timestamps
    end
  end
end
