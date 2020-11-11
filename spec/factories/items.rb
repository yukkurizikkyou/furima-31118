FactoryBot.define do
  factory :item do
    name             {"switch"}
    explanation      {"switch"}
    category_id      {2}
    days_id          {2}
    condition_id     {2}
    delivery_fee_id  {2}
    area_id          {2}
    price            {400}
    association :user  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end


