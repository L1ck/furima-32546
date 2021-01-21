FactoryBot.define do
  factory :item_order do
    user_id {'1'}
    item_id {'2'}
    token { 'tok_abcdefghijk00000000000000000' }
    zipcode { '123-4567' }
    area_id { '3' }
    city { '横浜市' }
    district { '1-1-1' }
    building { '建物ビル' }
    phone_number { '09022223333' }
  end
end
