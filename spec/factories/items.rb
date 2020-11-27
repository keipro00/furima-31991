FactoryBot.define do
  factory :item do
    name { '商品名' }
    comment { 'これは商品です' }
    category_id { 2 }
    status_id { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
    price { 300 }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end
