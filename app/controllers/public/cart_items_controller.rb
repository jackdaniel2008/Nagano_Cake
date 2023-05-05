class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      @cart_items = CartItem.all
      redirect_to cart_items_path
    else
      @cart_items = CartItem.all
      render :index
    end
  end

  def index
    @cart_items = CartItem.all
    @cart_item = CartItem
  end

  def update
    @cart_item = CartItem
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
