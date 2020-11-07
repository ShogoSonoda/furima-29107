class OrderAddress
  belongs_to :order
  include ActiveModel::Model
  attr_accessor :token, :order_id, :postal_code, :shipment_source_id, :city, :house_number, :building, :tel_number

  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipment_source
  validates :shipment_source_id, numericality: { other_than: 1 }


  with_options presence: true do
    validates :order_id
    validates :postal_code
    validates :city
    validates :house_number
    validates :building
    validates :tel_number
  end

  def save
    Order.create(user_id: item.user_id, item_id: item.id)
    Address.create(order_id: orderid, postal_code: postal_code, shipment_source_id: shipment_source_id, city: city, house_number: house_number, building: building, tel_number: tel_number)
  end
end