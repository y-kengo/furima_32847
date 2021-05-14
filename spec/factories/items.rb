FactoryBot.define do
  factory :item do
    name        {"tarou"}
    description {"aaa"}
    price       {"300"}
    category_id {2}
    status_id   {2}
    shipping_id {2}
    area_id     {2}
    day_id      {2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
