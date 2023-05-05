class CreateDailyGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_groups do |t|
      t.integer :menu_id
      t.integer :daily_menu_id
      t.timestamps
    end
  end
end
