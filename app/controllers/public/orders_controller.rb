class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = OrderHistory.new
    @customer = current_customer
  end


  def check
    @order = OrderHistory.new(order_history_params)
    @order.customer_id = current_customer.id

    #  [:select_address]=="0"のデータ(customerの住所)を呼び出す
    if params[:order_history][:select_address] == "0"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name

    # 新規住所入力 [:select_address]=="1"としてデータをhtmlから受ける
    elsif params[:order_history][:select_address] == "1"
      @order.shipping_postal_code = params[:order_history][:shipping_postal_code]
      @order.shipping_address = params[:order_history][:shipping_address]
      @order.shipping_name = params[:order_history][:shipping_name]

    else
      render 'new'
    end

    @cart_items = current_customer.cart_items.all
  end


  def create
    @order = OrderHistory.new(order_history_params)
    @order.customer_id = current_customer.id
    @order.save

    #カート内商品を1つずつ取り出しループしてhistory_detailテーブルに保存
    current_customer.cart_items.each do |cart_item|
      @history_detail = HistoryDetail.new
      @history_detail.order_history_id = @order.id
      @history_detail.item_id = cart_item.item_id
      @history_detail.post_tax_price = cart_item.item.with_tax_price
      @history_detail.amount = cart_item.amount
      @history_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end


  def complete
  end

  def index
    @orders = current_customer.order_histories.all
  end

  def show
    @order = OrderHistory.find(params[:id])
    @history_details = @order.history_details.all
  end

  private

  def order_history_params
    params.require(:order_history).permit(:customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :postage, :total_amount, :payment_method)
  end
end