class Public::CartItemsController < ApplicationController
  def create
    @cart_items = current_customer.cart_items.all
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @genres = Genre.all
    if @cart_item.amount != nil
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
          new_amount = cart_item.amount + @cart_item.amount
          cart_item.update_attribute(:amount, new_amount)
          @cart_item.delete
        end
      end
      @cart_item.save
      redirect_to public_cart_items_path
    else
      @item = @cart_item.item
      @cart_item = CartItem.new
      flash[:notice] = "個数を選択してください"
      render "public/items/show"
    end
  end

  def index
    @cart_items = CartItem.all
    @total_price = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path

  end

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
