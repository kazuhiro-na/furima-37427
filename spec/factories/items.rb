FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.paragraph }
    category { Category.find(1) }
    condition { Condition.find(1) }
    burden { Burden.find(1) }
    prefecture { Prefecture.find(1) }
    shipping_day { ShippingDay.find(1) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
