require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'image,name,description,category_id,status_id,shipping_id,shipment_source_id,days_id,priceが存在すれば出品できる' do
        
      end

      it 'priceは半角数字で入力' do
        
      end
    end

    context '商品が出品できない場合' do
      it 'imageが空の時' do
        
      end

      it 'nameが空の時' do
        
      end

      it 'descriptionが空の時' do
        
      end

      it 'category_idが1の時' do
        
      end

      it 'status_idが1の時' do
        
      end

      it 'shipping_idが1の時' do
        
      end

      it 'shipment_source_idが1の時' do
        
      end

      it 'days_idが1の時' do
        
      end

      it 'priceが空の時' do
        
      end

      it 'priceが¥300未満の時' do
        
      end

      it 'priceが¥9,999,999より大きい時' do
        
      end

      it 'priceが全角数字の時' do
        
      end

    end
  end
end
