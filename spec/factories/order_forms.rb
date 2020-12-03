FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture { 2 }
    municipality { '札幌市' }
    house_number { '青山1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
  end
end
