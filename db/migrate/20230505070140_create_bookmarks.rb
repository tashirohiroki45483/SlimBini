class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :daily_menu_id
      t.timestamps
    end
  end
end
