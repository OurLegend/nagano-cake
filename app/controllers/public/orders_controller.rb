class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :request_post?, only: [:confirm]

  def new
    @order = Order.new
    @destination = Destination.new
  end

  def confirm
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params)
    #ラジオボタンの選択によって分岐します
    if params[:order][:address_option] == "1"
      @order.shipping_postcode = current_customer.postcode
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name+current_customer.last_name
    elsif params[:order][:address_option] == "2"
      @order.shipping_postcode = Destination.find(params[:order][:destination]).shipping_postcode
      @order.shipping_address = Destination.find(params[:order][:destination]).shipping_address
      @order.shipping_name = Destination.find(params[:order][:destination]).direction
    elsif params[:order][:address_option] == "3"
      @order.shipping_postcode = params[:order][:shipping_postcode]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:direction]
    end
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.amount = cart_item.amount
        @order_detail.price = cart_item.item.with_tax_price
        @order_detail.order_id =  @order.id
        @order_detail.save
      end
      #カートの中身を削除
      current_customer.cart_items.destroy_all
      redirect_to public_orders_complete_path
    else
      #住所が入力されなければ注文できません
      flash[:notice] = "住所の情報がありません。"
      render :new
    end
  end

  def index
    @orders = current_customer.orders.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
  end

  private
#リロードすると情報入力に戻ります
  def request_post?
    redirect_to new_public_order_path, notice: "※もう一度最初から入力してください。" unless request.post?
  end

  def order_params
    params.require(:order).permit(:payment_method, :shipping_address, :postage, :shipping_postcode, :shipping_name, :total_price)
  end
end
