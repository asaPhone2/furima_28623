class MessagesController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    @message = Message.create(message_params)
    redirect_to item_path(@item.id)
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
