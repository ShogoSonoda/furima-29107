FactoryBot.define do
  factory :item do
    name                 { 'カメラ' }
    description          { '写真が撮れる' }
    category_id          { 6 }
    status_id            { 2 }
    shipping_id          { 2 }
    shipment_source_id   { 2 }
    days_id              { 2 }
    price                { 5000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
