class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @customer = Customer.find(params[:id])
    @cart_items = @customer.cart_items.all
  end
end
