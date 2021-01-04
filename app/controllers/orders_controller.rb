class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @form = Form.new
  end

  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(form_params)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def show
  end
  
  private
  
  def form_params
    params.require(:form).permit(:post_code, :prefecture_code_id, :city, :house_number, :bilding_number, :phone_number, :purchase_history).merge(user_id: current_user.id,item_id: params[:item_id])
  end


end