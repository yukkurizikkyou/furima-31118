FactoryBot.define do
  factory :order do
    postal_code  {"111-1111"}
    prefecture_id   {1}
    city         {Faker::Lorem.sentence}
    house_number {Faker::Lorem.sentence}
    building     {Faker::Lorem.sentence}
    phone_number {"00000000000"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
