class Item < ApplicationRecord

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :genre_id, numericality: { only_integer: 1 }
  validates :condition_id, numericality: { only_integer: 1 }
  validates :delivery_charge_id, numericality:{ only_integer: 1 }
  validates :prefecture_id, numericality: { only_integer: 1 }
  validates :transit_time_id, numericality: { only_integer: 1 }
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_one_attached :image
end
