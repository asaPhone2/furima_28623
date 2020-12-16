class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:introduction, :image, :name, :price, :item_condition_id, :category_id, :delivery_fee_id, :preparation_day_id, :prefecture_code_id).merge(user_id: current_user.id)
  end
end
