FactoryBot.define do
  factory :item do
    name                    {"商品名"}
    description             {Faker::Lorem.sentence}
    category_id             {2}
    item_condition_id       {3}
    delivery_fee_burden_id  {2}
    prefecture_id          {18}
    delivery_period_id      {4}
    price                   {3000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end