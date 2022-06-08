FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.paragraph }
    category { Category.find(1) }
    condition { Condition.find(1) }
    burden { Burden.find(1) }
    prefecture { Prefecture.find(1) }
    shipping_day { ShippingDay.find(1) }
    price { Faker::Commerce.price(range: 300..9_999_999, as_string: true) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
