FactoryBot.define do
  factory :item do
    title                 {'タイトル'}
    text                  {'説明文です'}
    category_id           {2}
    state_id              {2}
    charge_id             {2}
    prefecture_id         {2}
    scheduled_delivery_id {2}
    price                 {10000}

    user

  end
end
