class OrdersController < ApplicationController
  def index

  end

  def new
    @oder_address = OrderAddress.new
  end

  def create
    @oder_address = OrderAddress.new(order_params)
    if @oder_address.valid?
      @oder_address.save
      redirect_to :index
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:oder_address).permit(:user_id, :item_id, :order_id, :postal_code, :shipment_source_id, :city, :house_number, :building, :tel_number)
  end
end
