class Admin::OrderDetailsController < ApplicationController
  def update
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order
  @order_details = @order.order_details
  @order_detail.update(order_detail_params)
  
  if @order_detail.production_status == "maiking"
    @order.update(status: "in_making")
  
  elsif @order.order_details.count == @order.order_details.where(production_status: "completion_of_production").count
        @order.update(status: "preparing_to_ship")
  end      
  redirect_to admin_order_path(@order_detail.order.id) 
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
