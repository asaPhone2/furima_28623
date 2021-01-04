FactoryBot.define do
  factory :form do
    post_code      { "111-1111" }
    prefecture_code_id  { 2 }
    city           { "横浜市" }
    house_number   { "2-2" }
    phone_number   { "00000000000" }

    user_id   { 2 }
    item_id   { 2 }
  end
end