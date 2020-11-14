class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :purchaser_check
  before_action :seller_check

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @item.update(purchaser: current_user.id)
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :shipment_source_id, :city, :house_number, :building, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  private

  def search_item
    @item = Item.find(params[:item_id])
  end
  
  def purchaser_check
    search_item
    if @item.purchaser.present?
      render template: "items/index"
    end
  end

  def seller_check
    search_item
    if user_signed_in? && @item.user.id == current_user.id
      render template: "items/index"
    end
  end
end
