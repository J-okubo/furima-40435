class Item < ApplicationRecord

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :genre_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality:{ other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :transit_time_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :transittime
  belongs_to :prefecture
  belongs_to :deliverycharge
  belongs_to :condition

  belongs_to :user
  has_one_attached :image
end
