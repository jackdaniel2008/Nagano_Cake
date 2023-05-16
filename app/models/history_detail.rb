class HistoryDetail < ApplicationRecord

  belongs_to :order_history
  belongs_to :item

  ## 小計を求めるメソッド
  def subtotal
      item.with_tax_price * amount
  end

end
