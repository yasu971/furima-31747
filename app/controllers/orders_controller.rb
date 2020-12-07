class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :find_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.order != nil
      redirect_to root_path
    end
end

  def create
    @order_form = OrderForm.new(set_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
 
  private
  def set_params
    params.require(:order_form).permit(:user, :item, :order, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: set_params[:token],
      currency: 'jpy'
    )
  end
end