class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
   @items = Item.all.order("created_at DESC")
   @order_form = OrderForm.new

  end

  def new
    @item = Item.new
  end

  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @order_form = OrderForm.new
  end

  def edit
    if @item.user != current_user
      redirect_to root_path
    end
    if @item.order != nil
      return
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      if @item.destroy
      redirect_to root_path
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_condition_id, :delivery_fee_burden_id, :prefecture_id, :delivery_fee_burden_id, :delivery_period_id, :price, :image).merge(user_id: current_user.id)
  end  

  def set_item
    @item = Item.find(params[:id])
  end

end