FactoryBot.define do
  factory :record_address do
    token { "tok_00000000" }
    tell { "08012345678" }
    postal_code { Faker::Address.zip}
    prefecture_id { 1 }
    municipalities { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
  end
end
 