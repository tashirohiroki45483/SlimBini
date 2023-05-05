class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :calories
      t.float :protein
      t.float :fat
      t.float :carbohydrate

      t.timestamps
    end
  end
end
