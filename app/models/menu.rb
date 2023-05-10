class Menu < ApplicationRecord

  has_many :menu_products, dependent: :destroy
  has_many :daily_groups, dependent: :destroy
  has_many :products, through: :menu_products
  belongs_to :user

end
