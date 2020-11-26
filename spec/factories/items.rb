FactoryBot.define do
  factory :item do

 name {"商品名"}
 comment {"これは商品です"}
#  image { "#{Item:0x00007fc20aff9230}" }
 category_id {2}
 status_id {2}
 delivery_fee_id {2}
 prefecture_id {2}
 delivery_days_id {2}

  end
end
