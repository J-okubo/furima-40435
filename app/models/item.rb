class Item < ApplicationRecord

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :genre_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :transit_time_id, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_one_attached :image
end
