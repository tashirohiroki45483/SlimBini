class Product < ApplicationRecord

  has_many :menus
  belongs_to :user, optional: true
  belongs_to :genre

  has_one_attached :image
end
