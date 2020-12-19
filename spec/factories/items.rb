FactoryBot.define do
  factory :item do
    name            { Faker::Commerce.product_name }
    introduction    {Faker::Lorem.sentence}
    price           { 300 }
    item_condition_id  {2}
    prefecture_code_id {2}
    preparation_day_id {2}
    delivery_fee_id    {2}
    category_id        {2}

    # association :user
  end
end
