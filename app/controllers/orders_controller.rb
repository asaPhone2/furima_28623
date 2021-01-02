class OrdersController < ApplicationController

  def index
    @form = Form.new
  end

  def create
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
    params.require(:form).permit(:post_code, :prefecture_code_id, :city, :house_number, :bilding_number, :phone_number, :purchase_history).merge(user_id: @current_user,item_id: @current_item)
  end


end