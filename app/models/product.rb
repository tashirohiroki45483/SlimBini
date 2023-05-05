class Product < ApplicationRecord
  
  has_many :menu_products, dependent: :destroy
  belongs_to :user
  belongs_to :genre
  
  has_one_attached :image
end
