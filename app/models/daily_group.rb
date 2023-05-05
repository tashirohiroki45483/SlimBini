class DailyGroup < ApplicationRecord
  
  belongs_to :menu
  belongs_to :daily_menu
  
end
