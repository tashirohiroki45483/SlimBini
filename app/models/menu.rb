class Menu < ApplicationRecord

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :menu_products
  has_many :products, through: :menu_products
  belongs_to :user

  def bookmarked_by?(user)
    bookmarks.exists?(user: user) #ブックマークの中に、指定したuserによるものがあるか？
  end

  def liked_by?(user)
    likes.exists?(user: user) #ライクの中に、指定したuserによるものがあるか？
  end

end
