class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to 'root'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_id, :shipment_source_id, :days_id, :price).merge(user_id: crurrent_user.id)
  end
end
