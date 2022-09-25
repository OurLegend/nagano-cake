class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!, if: :public_url, except: [:index, :show]    
  
  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
end
