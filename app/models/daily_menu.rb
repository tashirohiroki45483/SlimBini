class DailyMenu < ApplicationRecord
  
  has_many :daily_groups, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
end
