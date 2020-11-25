require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context "商品出品できる場合" do
      it "必要な項目が全て埋まって入れば、商品出品される" do
        expect(@item).to be_valid
      end
    end
    context "商品出品できない場合" do
      it "画像がないと商品出品されない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと商品出品されない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと商品出品されない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーがないと商品出品されない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end     
      it "商品の状態がないと商品出品されない" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition must be other than 1")
      end     
      it "配送料の負担がないと商品出品されない" do
        @item.delivery_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee burden must be other than 1")
      end     
      it "発送元の地域がないと商品出品されない" do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end     
      it "発送までの日数がないと商品出品されない" do
        @item.delivery_period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery period must be other than 1")
      end     
      it "販売価格がないと商品出品されない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end     

    end
  end  
end