FactoryBot.define do
  factory :item do
    name                 {"カメラ"}
    description          {"綺麗な写真を撮れる"}
    category_id          {6}
    status_id            {2}
    shipping_id          {2}
    shipment_source_id   {2}
    days_id              {2}
    price                {5000}

    association :user
  end
end
