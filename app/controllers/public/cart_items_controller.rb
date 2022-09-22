class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def index
    @cart_items = CartItem.all
    @total_price = 0
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
