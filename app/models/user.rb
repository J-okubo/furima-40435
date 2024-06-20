class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  validates :first_name_zen, presence: true
  validates :last_name_zen, presence: true
  validates :first_name_zen, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'is invalid. Input full-width characters' }
  validates :last_name_zen, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name_han, presence: true
  validates :last_name_han, presence: true
  validates :first_name_han, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :last_name_han, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :date_of_birth, presence: true
  validates :first_name_zen, :last_name_zen, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Input full-width characters" }
  validates :first_name_han, :last_name_han, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters" }

  #has_many :item_comments
  #has_many :items_purchases
  #has_many :items_lists
end
