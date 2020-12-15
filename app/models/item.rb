class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparetion_day
  
  validates :image, presence: true
end
