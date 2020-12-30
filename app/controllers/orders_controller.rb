class OrdersController < ApplicationController
  def index
    @forms = Form.all
  end
end
