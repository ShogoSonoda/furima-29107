class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :shipment_source_id, :city, :house_number, :building, :tel_number

  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :tel_number
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, shipment_source_id: shipment_source_id, city: city, house_number: house_number, building: building, tel_number: tel_number)
  end
end