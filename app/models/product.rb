class Product < ApplicationRecord
  before_validation :set_default_values #バリデーション前のアクション

  has_many :menus
  has_many :menu_products, dependent: :destroy
  has_many :menus, through: :menu_products
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :user, optional: true
  belongs_to :genre

  validates :name, :calories, presence: true #空で登録できない
  validates_numericality_of :calories, :protein, :fat, :carbohydrate #数値であることを確認する

  has_one_attached :image

  private

  def set_default_values #空の場合に自動的に0に設定する
    self.protein ||= 0
    self.fat ||= 0
    self.carbohydrate ||= 0
  end

end
