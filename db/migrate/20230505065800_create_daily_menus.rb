class CreateDailyMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_menus do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
