class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
    # if @item.user != current_user
    #   redirect_to root_path
    # end
  end

  def new
    @order_form = OrderForm.new
    # if @item.user != current_user
    #   redirect_to root_path
    # end
  end

  def create
    @item = Item.find(params[:item_id])
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: set_params[:token],
      currency: 'jpy'
    )
  end
end