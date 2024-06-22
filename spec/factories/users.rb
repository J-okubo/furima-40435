FactoryBot.define do
  factory :user do
    nickname              {"nickename"}
    email                 {Faker::Internet.email}
    password              {"password123"}
    password_confirmation {password}
    first_name_zen        {"全角名字"}
    last_name_zen         {"全角名前"}
    first_name_han        {"カタカナミョウジ"}
    last_name_han         {"カタカナナマエ"}
    date_of_birth         {"1990-01-01"}
  end
end
