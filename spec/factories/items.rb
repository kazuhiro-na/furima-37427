FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.paragraph }
    category { Category.all.sample }
    condition { Condition.all.sample }
    burden { Burden.all.sample }
    prefecture { Prefecture.all.sample }
    shipping_day { ShippingDay.all.sample }
    price { Faker::Commerce.price(range: 300..9_999_999, as_string: true) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
