FactoryBot.define do
  factory :order_address do
    postal_code   { '273-0024' }
    prefecture_id { 13 }
    city          { '船橋市' }
    house_number  { '1-1429-19' }
    building_name { 'やべべ館' }
    phone         { '09067051997' }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end
