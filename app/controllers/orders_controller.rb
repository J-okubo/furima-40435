class OrdersController < ApplicationController
  before_action :set_item, only: [:index,:create]

  def index
    @order_shipping = OrderShipping.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if user_signed_in?
      redirect_to root_path if current_user == @item.user || @item.order!= nil
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save(params,current_user.id)
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_shipping).permit(:post_code,:prefecture_id,:street_address,:street_number,:building_name,:phone_number).merge(user_id:current_user.id, item_id:params[:item_id], token:params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @order_shipping.item_price,  # 商品の値段
      card: @order_shipping.token,    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
