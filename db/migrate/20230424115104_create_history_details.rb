class CreateHistoryDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :history_details do |t|

      t.integer :item_id, null: false
      t.integer :order_history_id, null: false
      t.integer :post_tax_price, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
