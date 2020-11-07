class OrderAddress
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
    user = User.find(params[:])
    Order.create(user_id: user.id, item_id: item.id)
  end
end