class CreateMenuProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_products do |t|
      t.integer :menu_id
      t.integer :product_id
      t.string :meal_type

      t.timestamps
    end
  end
end
