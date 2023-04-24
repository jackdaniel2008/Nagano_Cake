class OrderHistory < ApplicationRecord
  
  has_many :history_details, dependent: :destroy
  belongs_to :customer
  
end
