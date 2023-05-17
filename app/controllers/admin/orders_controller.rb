class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = OrderHistory.find(params[:id])
    @history_details = HistoryDetail.where(order_history_id: @order.id)
    @customer = @order.customer
  end
end