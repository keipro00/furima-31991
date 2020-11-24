FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000000"}
    last_name             {"hoge"}
    first_name            {"fuga"}
    last_name_kana        {"hooge"}
    first_name_kana       {"fuuga"}
    birth_day             {"11111111"}
  end
end