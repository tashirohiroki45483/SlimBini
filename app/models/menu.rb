class Menu < ApplicationRecord

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :menu_products
  has_many :products, through: :menu_products
  belongs_to :user

end
