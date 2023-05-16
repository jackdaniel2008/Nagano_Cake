class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @history_detail = HistoryDetail.find(params[:id])
    @order = @history_detail.order_history
    @customer = @order.customer
    # whereメソッドを使ったeach文？
    @history_details = HistoryDetail.where(order_history_id: 4)
  end
end