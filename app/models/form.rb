class Form
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_code_id, :city, :house_number, :bilding_number, :phone_number, :purchase_history, :user_id, :item_id
  with_options presence: true do
    validates :token

    validates :post_code
    validates :prefecture_code_id
    validates :city
    validates :house_number
    validates :bilding_number
    validates :phone_number
    validates :purchase_history
    
    validates :user_id
    validates :item_id
  end
  # belongs_to :user
  # belongs_to :item

  def save
    SendingDestination.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_number: building_number,phone_number: phone_number,purchase_history: purchase_history)
    # 寄付金の情報を保存
    Order.create(item_id: item.id, user_id: user.id)
  end
end