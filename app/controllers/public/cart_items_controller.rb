class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path(@cart_item.id)
    else
      render template: "public/items/show"
    end
  end

  def index
  end

  def update
  end

  def destroy
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
