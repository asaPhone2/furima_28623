FactoryBot.define do
  factory :form do
    post_code      { "111-1111" }
    prefecture_code_id  { 2 }
    city           { "横浜市" }
    house_number   { "2-2" }
    phone_number   { "00000000000" }
    token {"tok_abcdefghijk00000000000000000"}
    item_id   { 2 }
    user_id   { 2 }


    # association :user
    # association :item

  end
end