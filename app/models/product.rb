class Product < ApplicationRecord

  has_many :menus
  has_many :menu_products
  has_many :menus, through: :menu_products
  belongs_to :user, optional: true
  belongs_to :genre

  has_one_attached :image
end
