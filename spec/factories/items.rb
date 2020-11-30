FactoryBot.define do
  factory :item do
    title       {Faker::Name.initials(number: 4)}
    explain     {Faker::Lorem.sentence}
    image       {Faker::Lorem.sentence}
    price       { 400}
    category_id      {"3"}
    status_id        {"3"}
    fee_id   {"2"}
    prefecture_id    {"33"}
    days_id  {"2"}
    association :user
  end
end
