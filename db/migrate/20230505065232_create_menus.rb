class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :user_id
      t.integer :total_calories
      t.float :total_protein
      t.float :total_fat
      t.float :total_carbohydrate
      t.string :meal_type
      t.string :integer
      t.timestamps
    end
  end
end
