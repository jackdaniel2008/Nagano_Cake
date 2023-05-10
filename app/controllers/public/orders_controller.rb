class Public::OrdersController < ApplicationController

  def new
    @order = OrderHistory.new
    @customer = current_customer
  end

  def check
    @order = OrderHistory.new(order_history_params)

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

  def complete
  end

  def update
  end

  def index
  end

  def show
  end

  private

  def order_history_params
    params.require(:order_history).permit(:payment_method, :shipping_postal_code, :shipping_address, :shipping_name)
  end
end