class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :product

  validates :tag_id, uniqueness: { scope: :post_id }
end
