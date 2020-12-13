FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { Faker::Person.first.kanji }
    family_name           { Faker::Person.last.kanji }
    first_name_kana       { Faker::Person.first.kana }
    family_name_kana      { Faker::Person.last.kana }
    birth_day             { Faker::Date.backward }
  end
end
