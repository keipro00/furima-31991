FactoryBot.define do
  factory :user do
    nickname              {"テスト"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
    last_name             {"テスト"}
    first_name            {"コド"}
    last_name_kana        {"テスト"}
    first_name_kana       {"コド"}
    birth_day             {"11111111"}
  end
end

