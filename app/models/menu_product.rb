class MenuProduct < ApplicationRecord

  belongs_to :menu, optional: true
  belongs_to :product
  belongs_to :user

end
