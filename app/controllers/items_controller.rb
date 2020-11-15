class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :search_item, only: [:show, :edit, :update, :destroy]
  before_action :seller_check, only: [:edit, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_id, :shipment_source_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def search_item
    @item = Item.find(params[:id])
  end

  def seller_check
    search_item
    unless user_signed_in? && @item.user.id == current_user.id
      render :index
    end
  end
end
