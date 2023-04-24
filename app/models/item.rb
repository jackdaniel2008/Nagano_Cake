class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :history_details, dependent: :destroy

end
