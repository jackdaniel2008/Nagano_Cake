class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def confirm
    @order = Order.new(order_history_params)
  end

  def check
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
    params.require(:order_history).permit(:shipping_name, :address, :total_price)
  end
end
