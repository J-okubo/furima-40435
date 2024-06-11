class ItmesController < ApplicationController
  def index
    @items = Items.all
  end

end
