class Item < ApplicationRecord

  with_options presence: true do

    with_options numericality: { other_than: 1 , message: "can't be blank" } do
      validates :image
      validates :title
      validates :text
      validates :category_id
      validates :state_id
      validates :charge_id
      validates :scheduled_delivery_id
      validates :price, format: { with: /\A[0-9]+\z/ },
                        numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    end

    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }

  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :scheduled_delivery

end
