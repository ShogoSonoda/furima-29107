class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :day

  validates :name, :description, :price, presence: true

  validates :category_id, :status_id, :shipping_id, :shipment_source_id, :days_id, numericality: { other_than: 1 }

  validates :price, numericality: { only_integer: true, greater_than: 300,less_than: 9999999 }
end
