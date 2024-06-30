FactoryBot.define do
  factory :item do
    name                 {"name"}
    description          {"description"}
    genre_id             { 2 }
    condition_id         { 2 }
    delivery_charge_id   { 2 }
    prefecture_id        { 2 }
    transit_time_id      { 2 }
    price                { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
