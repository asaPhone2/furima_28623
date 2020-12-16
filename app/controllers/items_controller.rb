class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def create
  end

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
