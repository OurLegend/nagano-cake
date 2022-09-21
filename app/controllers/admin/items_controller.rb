class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genre = Genre.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :detail, :image, :unit_price, :is_active)
  end
end