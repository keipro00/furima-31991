FactoryBot.define do
  factory :item_form do
    postcode        { "123-4567" }
    prefecture_id   { 2 }
    city            {"江戸川"}
    block           { 47 }
    building        {""}
    phone           { "08012345678" }
    token           {"tok_abcdefghijk00000000000000000"}
    # user_id         { 1 }
    # item_id         { 1 }
  # association :user
  # association :item
  end
end
