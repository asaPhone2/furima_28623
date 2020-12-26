class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end

  with_options numericality: { only_integer: true, greater_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :delivery_fee_id
    validates :prefecture_code_id
    validates :preparation_day_id
  end

  validates_associated :image

  # has_one :purchase_history
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day
end
