class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with:/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ , message:"Input full-width characters" }
  validates :first_name_zen, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Input full-width characters" }
  validates :last_name_zen, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Input full-width characters" }
  validates :first_name_han, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters" }
  validates :last_name_han, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters" }
  validates :date_of_birth, presence: true
  has_many :items
  belongs_to :user
  has_one :order
end
