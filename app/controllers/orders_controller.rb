class OrdersController < ApplicationController
  before_action :search_item, only: [:index, :create, :purchaser_check, :seller_check]
  before_action :authenticate_user!
  before_action :purchaser_check
  before_action :seller_check

  def index
    @order_address = OrderAddress.new
  end

  def create
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def search_item
    @item = Item.find(params[:item_id])
  end

  def purchaser_check
    if @item.purchaser.present?
      redirect_to root_path
    end
  end

  def seller_check
    if user_signed_in? && @item.user.id == current_user.id
      redirect_to root_path
    end
  end
end
