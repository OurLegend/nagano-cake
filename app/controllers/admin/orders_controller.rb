class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
    
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    redirect_to admin_order_path
  end
  
   private
 
  def order_params
    params.require(:order).permit(:payment_method, :shipping_address, :postage, :shipping_postcode, :shipping_name, :total_price, :status)
  end
end
