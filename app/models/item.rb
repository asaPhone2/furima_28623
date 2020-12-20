class Item < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_code_id, presence: true
  validates :preparation_day_id, presence: true

  validates_associated :image
  validates :image, presence: true

  # has_one :purchase_history
  # belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day

  validates :image, presence: true
end
