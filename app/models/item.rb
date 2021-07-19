class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
