class CreateDailyGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_groups do |t|
      t.timestamps
    end
  end
end
