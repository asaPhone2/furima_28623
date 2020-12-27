class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_item, only: [:edit, :show, :update]
  # before_action :not_user, only: [:edit, :update]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:introduction, :image, :name, :price, :item_condition_id, :category_id, :delivery_fee_id, :preparation_day_id, :prefecture_code_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def not_user
    if @item.user_id != current_user.id
      redirect_to items_path
    else
      @item.update(item_params)
      redirect_to item_path
    end
  end
end
