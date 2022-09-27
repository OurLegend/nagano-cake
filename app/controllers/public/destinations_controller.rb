class Public::DestinationsController < ApplicationController
  def index
    @destinations = current_customer.destinations.all
    @destination = current_customer.destinations.new
  end

  def create
    @destination = current_customer.destinations.new(destination_params)
    @destination.customer_id = current_customer.id
    if @destination.save
      redirect_to public_destinations_path
    else
      @destinations = current_customer.destinations.all
      render :index
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      redirect_to public_destinations_path
    else
      render :edit
    end
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    redirect_to public_destinations_path
  end

  private
  def destination_params
    params.require(:destination).permit(:shipping_postcode, :shipping_address, :direction)
  end

end
