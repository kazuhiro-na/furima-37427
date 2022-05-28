FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    name_sei { person.last.kanji }
    name_mei { person.first.kanji }
    name_sei_kana { person.last.katakana }
    name_mei_kana { person.first.katakana }
    birthday { Faker::Date.backward }
  end
end
