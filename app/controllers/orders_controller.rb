class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @form = Form.new
    if current_user == @item.user
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(form_params)
    if @form.valid?
      pay_item
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
    params.require(:form).permit(:post_code, :prefecture_code_id, :city, :house_number, :bilding_number, :phone_number, :purchase_history).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end

end