class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :day

  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end

  with_options numericality: { other_than: 1 }
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :shipment_source_id
    validates :days_id
  end

  validates :price, numericality: { only_integer: true, greater_than: 300,less_than: 9999999 }
end
