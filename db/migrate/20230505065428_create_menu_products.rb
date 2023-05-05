class CreateMenuProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_products do |t|
      t.integer :menu_id
      t.integer :product_id
      t.integer :quantity
      t.timestamps
    end
  end
end
