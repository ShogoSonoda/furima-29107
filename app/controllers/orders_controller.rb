class OrdersController < ApplicationController
  def index

  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to :index
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:user_id, :item_id, :order_id, :postal_code, :shipment_source_id, :city, :house_number, :building, :tel_number)
  end
end
