class Item < ApplicationRecord

  with_options presence: true do

    with_options numericality: { other_than: 1 , message: "can't be blank" } do
        validates :category_id
        validates :state_id
        validates :charge_id
        validates :prefecture_id
        validates :scheduled_delivery_id
    end
    
      validates :image
      validates :title
      validates :text
      validates :price, format: { with: /\A[0-9]+\z/ },
                        numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  end

  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :scheduled_delivery

end