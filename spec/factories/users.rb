FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"試験"}
    first_name_kana       {"シケン"}
    last_name             {"単体"}
    last_name_kana        {"タンタイ"} 
    birthday              {"20191116"} 
    telephone             {"09046131596"}
  end
end
