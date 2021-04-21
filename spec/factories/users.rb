FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {"test@test"}
    password {"test111"}
    password_confirmation {password}
    family_name {"一郎"}
    first_name {"鈴木"}
    family_name_kana {"イチロウ"}
    first_name_kana {"スズキ"}
    birth_day {Faker::Date.forward(days: 23)}
  end
end