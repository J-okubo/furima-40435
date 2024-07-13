FactoryBot.define do
  factory :shipping_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    street_address { 'Tokyo' }
    street_number { '1-1-1' }
    building_name { 'Test Building' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
