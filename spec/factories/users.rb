FactoryBot.define do
  factory :user do
    name                   {Faker::Name.initials(number: 2)}
    email                  {Faker::Internet.free_email}
    password               {"1234abcd"}
    first_name             {"佐藤"}
    last_name              {"太郎"}
    first_name_kana        {"サトウ"}
    last_name_kana         {"タロウ"}
    birthday               {"1992-05-05"}
  end
end

