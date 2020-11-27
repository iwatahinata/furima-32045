FactoryBot.define do
  factory :buy_house do
    postal_code    {'333-9999'}
    prefecture_id  {'23'}
    city           {'名古屋市守山区'}
    address        {'2-2-2'}
    house_name     {'森ハイツ'}
    phone_number   {'09012345678'}
    token          {"tok_abcdefghijk00000000000000000"}
    item_id        {'1'}
    user_id        {'1'}
  end
end
