class CreateMenuProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_products do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
