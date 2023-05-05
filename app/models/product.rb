class Product < ApplicationRecord
  
  has_many :munu_products, dependent: :destroy
  belongs_to :user
  belongs_to :genre
  
end
