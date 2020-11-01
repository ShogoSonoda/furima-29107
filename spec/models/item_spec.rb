require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'image,name,description,category_id,status_id,shipping_id,shipment_source_id,days_id,priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it 'priceは半角数字で入力' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'imageが空の時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空の時' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空の時' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが1の時' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idが1の時' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'shipping_idが1の時' do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping must be other than 1')
      end

      it 'shipment_source_idが1の時' do
        @item.shipment_source_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be other than 1')
      end

      it 'days_idが1の時' do
        @item.days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Days must be other than 1')
      end

      it 'priceが空の時' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300未満の時' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it 'priceが¥9,999,999より大きい時' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end

      it 'priceが全角数字の時' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
