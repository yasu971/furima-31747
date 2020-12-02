class OrdersController < ApplicationController

  def index
    @order = OrderForm.new
  end
  
end
