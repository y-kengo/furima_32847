FactoryBot.define do
  factory :order_address do
    postal_code {'333-1234'}
    area_id {2}
    city {'愛知県'}
    address {'1-23-45'}
    building {'ルーセント'}
    phone_number  {'08012345678'}
    token {"tok_abcdefghijk00000000000000000"}
    #association :user
    #association :item
  end
end 