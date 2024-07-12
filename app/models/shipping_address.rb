class ShippingAddress < ApplicationRecord
  attr_accessor :token, :item_id, :user_id, :post_code, :prefecture_id, :street_address, :street_number, :building_name, :phone_number

  validates :token, presence: true
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :street_address, presence: true
  validates :street_number, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  belongs_to :order
end
