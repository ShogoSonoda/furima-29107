class OrderAddress
  include ActiveModel::Model
  attr_accessor :price, :token, :user_id, :item_id, :order_id, :postal_code, :shipment_source_id, :city, :house_number, :building, :tel_number

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :tel_number, format: { with: /\A\d{10,11}\z/ }
  end

  validates :shipment_source_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, shipment_source_id: shipment_source_id, city: city, house_number: house_number, building: building, tel_number: tel_number)
  end
end