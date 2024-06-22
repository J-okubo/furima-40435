class ItemsController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(item_params)
    if @user.save
      redirect_to root_path
    else
      render :new,status: :unprocessable_entit
    end
  end


private

 def item_params
  def prototype_params
    params.require(:user).permit(:title, :catch_copy, :concept, :image).merge(user_id:current_user.id)
  end

 end

end
