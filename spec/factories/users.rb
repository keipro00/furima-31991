FactoryBot.define do
  factory :user do
    nickname              { 'テスト' }
    email                 { Faker::Internet.free_email }
    password              { 'hoge1234' }
    password_confirmation { password }
    last_name             { 'テスト' }
    first_name            { 'コド' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'コド' }
    birth_day             { '11111111' }
  end
end
