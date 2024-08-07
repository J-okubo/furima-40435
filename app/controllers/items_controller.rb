class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update,:destroy]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
    if current_user != @item.user || @item.order != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
    end
      redirect_to root_path
  end

  private
   def item_params
      params.require(:item).permit(:name, :description, :image, :genre_id, :condition_id, :delivery_charge_id, :prefecture_id, :transit_time_id, :price ).merge(user_id:current_user.id)
   end

   def set_item
    @item = Item.find(params[:id])
   end
end
