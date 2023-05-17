class RenameCommentToMenuComment < ActiveRecord::Migration[6.1]
  def change
    rename_table :comments, :menu_comments
  end
end
