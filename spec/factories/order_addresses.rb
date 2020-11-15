FactoryBot.define do
  factory :order_address do
    token              {"tok_abcdefghijk00000000000000000"}
    user_id            {1}
    item_id            {1}
    order_id           {1}
    postal_code        {"111-2222"}
    shipment_source_id {5}
    city               {"加古川市"}
    house_number       {"111-22"}
    building           {"ハイタウン"}
    tel_number         {"08012345678"}
  end
end
