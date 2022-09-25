class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!, if: :public_url, except: [:index, :show]    
  
  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def admin_url
    request.fullpath.include?("/admin")
  end
end
