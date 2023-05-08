class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @cart_items = @customer.cart_items.all
  end
end
