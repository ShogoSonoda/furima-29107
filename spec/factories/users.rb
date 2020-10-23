FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password               { password }
    encrypted_password     { password }
    first_name             { '園田' }
    last_name              { '将吾' }
    first_name_kana        { 'ソノダ' }
    last_name_kana         { 'ショウゴ' }
    birth_date             { 1996 - 11 - 13 }
  end
end
