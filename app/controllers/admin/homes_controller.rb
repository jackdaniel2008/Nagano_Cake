class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @history_details = HistoryDetail.page(params[:page]).per(10)
  end
end