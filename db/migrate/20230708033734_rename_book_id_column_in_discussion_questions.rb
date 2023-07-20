class RenameBookIdColumnInDiscussionQuestions < ActiveRecord::Migration[7.0]
  def change
    rename_column :discussion_questions, :book_id, :bookclub_id
  end
end
