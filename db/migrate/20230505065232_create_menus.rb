class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
