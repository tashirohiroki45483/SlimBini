class MenuProduct < ApplicationRecord

  belongs_to :menu, optional: true
  belongs_to :product

end
