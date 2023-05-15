class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_menus, through: :bookmarks, source: :menu
  has_many :likes, dependent: :destroy
  has_many :liked_menus, through: :likes, source: :menu
  has_many :comments, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :menus, dependent: :destroy

  has_one_attached :image

  def self.guest #ゲストログイン
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

end
