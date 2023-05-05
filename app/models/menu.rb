class Menu < ApplicationRecord
  
  has_many :menu_products, dependent: :destroy
  has_many :daily_groups, dependent: :destroy
  belongs_to :user
  
end
