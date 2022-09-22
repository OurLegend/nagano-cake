class Admin::HomesController < ApplicationController
  def top
    @orders = Order.find(order_params)
    @order_details = Order_detail.find(order_detail_params)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:created_at, :customer_id, :status)
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:amount)
  end
end