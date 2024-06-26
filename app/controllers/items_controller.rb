class ItemsController < ApplicationController
  before_action :authenticate_user!,only:[:new]
  #before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


private

 def item_params
    params.require(:item).permit(:name, :description, :image, :genre_id, :condition_id, :delivery_charge_id, :prefecture_id, :transit_time_id, :price ).merge(user_id:current_user.id)
 end
end
