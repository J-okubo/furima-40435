class OrderShipping
  include ActiveModel::Model
   attr_accessor :token, :item_id, :user_id, :post_code, :prefecture_id, :street_address, :street_number, :building_name, :phone_number

  def item_price
    Item.find(item_id).price
  end

  with_options presence: true do
    validates :token, presence: true
    validates :item_id, presence: true
    validates :user_id, presence: true
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :street_address, presence: true
    validates :street_number, presence: true
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, street_address: street_address, street_number: street_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
