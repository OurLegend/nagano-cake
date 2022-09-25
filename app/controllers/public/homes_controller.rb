class Public::HomesController < ApplicationController
  def top
    #登録日が最新の商品4つを代入
    @items = Item.order(created_at: :desc).limit(4)
    @genres = Genre.all
  end

  def about
  end
end
