FactoryBot.define do
  factory :item do
    image                {"image"}
    name                 {"name"}
    description          {"Description"}
    genre_id             {"genre_id"}
    condition_id         {"condition_id"}
    delivery_charge_id   {"delivery_charge_id"}
    prefecture_id        {"prefecture_id"}
    transit_time_id      {"transit_time_id"}
    price                {"price"}
    price                {"99999"}
  end
end
