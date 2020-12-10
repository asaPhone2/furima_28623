class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true,uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :nickname, presence: true
  validates :password,presence: true, length: { minimum: 6 }
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :first_name,presence: true,format: { with: /\A[一-龥ぁ-ん]/ }
  validates :family_name,presence: true,format: { with: /\A[一-龥ぁ-ん]/ }
  validates :first_name_kana,presence: true,format: { with: /\A[ァ-ヶー－]+\z/}
  validates :family_name_kana,presence: true,format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day,presence: true
end
