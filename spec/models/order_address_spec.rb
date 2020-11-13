require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '商品が購入できる場合' do
      it 'user_id,item_id,order_id,postal_code,shipment_source_id,city,house_number,tel_numberが正しく入力されている' do
        expect(@order_address).to be_valid
      end

      it 'postal_codeにはハイフンがある' do
        @order_address.postal_code = "222-5555"
        expect(@order_address).to be_valid
      end

      it 'tel_numberは11桁の半角数字である' do
        @order_address.tel_number = "09044445555"
        expect(@order_address).to be_valid
      end

      it 'tel_numberは10桁の半角数字である' do
        @order_address.tel_number = "0903338888"
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'tokenがない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeがない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがない' do
        @order_address.postal_code = '1112222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
  
      it 'shipment_source_idが1の時' do
        @order_address.shipment_source_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipment source must be other than 1")
      end
  
      it 'cityがない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
  
      it 'house_numberがない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
  
      it 'tel_numberがない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end
  
      it 'tel_numberにハイフンがある' do
        @order_address.tel_number = "090-1111-2222"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
      end
  
      it 'tel_numberが12桁以上' do
        @order_address.tel_number = "090111122223"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
      end

      it '購入済みの商品を購入した時' do
        
      end
    end
  end
end
