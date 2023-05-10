class Menu < ApplicationRecord

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :product
  belongs_to :user

end
