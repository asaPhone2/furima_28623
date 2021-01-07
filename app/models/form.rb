class Form
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_code_id, :city, :house_number, :bilding_number, :phone_number, :purchase_history, :user_id, :item_id
  with_options presence: true do
    validates :token

    validates :post_code,format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_code_id,numericality: { only_integer: true, greater_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number,format: { with: /\A\d{10,11}\z/ }
    
    validates :user_id
    validates :item_id
  end
  # belongs_to :user
  # belongs_to :item

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    SendingDestination.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, bilding_number: bilding_number,phone_number: phone_number, order_id: order.id)
  end
end