class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :nickname, presence: true

    with_options format: { with: /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/ } do
      validates :password, presence: true
      validates :password_confirmation, presence: true
    end

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :first_name, presence: true
      validates :family_name, presence: true
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana, presence: true
      validates :family_name_kana, presence: true
    end

    validates :birth_day, presence: true
end
