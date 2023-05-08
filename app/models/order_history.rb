class OrderHistory < ApplicationRecord
  
  has_many :history_details, dependent: :destroy
  belongs_to :customer
  
  # enumhelpをgemfileに記述してbundleインストールした後に記述
  # クレジットカードか銀行振込かの選択肢
  enum payment_method: { credit_card: 0, transfer: 1 }
  
end
