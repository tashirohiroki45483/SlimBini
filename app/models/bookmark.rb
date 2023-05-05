class Bookmark < ApplicationRecord
  
  belongs_to :user
  belongs_to :daily_menu
  
end
