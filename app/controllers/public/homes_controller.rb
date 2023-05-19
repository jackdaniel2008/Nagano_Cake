class Public::HomesController < ApplicationController
  def top
    # :asc,古い順 :desc,新しい順
    @items = Item.all.order(created_at: :desc)
  end

  def about
  end
end
