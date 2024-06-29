FactoryBot.define do
  factory :item do
    name                 {"name"}
    description          {"description"}
    genre_id             { 1 }
    condition_id         { 1 }
    delivery_charge_id   { 1 }
    prefecture_id        { 1 }
    transit_time_id      { 1 }
    price                {"99999"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
