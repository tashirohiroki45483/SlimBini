class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :meal_type
      t.integer :quantity
      t.integer :daily_menu_id
      t.timestamps
    end
  end
end
