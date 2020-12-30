class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token
  with_options presence: true do
    validates :token

    validates :post_code
    validates :prefecture_code_id
    validates :city
    validates :house_number
    validates :bilding_number
    validates :phone_number

    with_options foreign_key: true do
      validates :purchase_history, foreign_key：true

      validates :user
      validates :item
    end
  end

  def save
    @history.save
    @sending_destination.save
  end
end
