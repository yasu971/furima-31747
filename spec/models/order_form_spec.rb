require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '住所情報の保存' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
    expect(@order_form).to be_valid
    end
    it 'トークンが空だと保存できないこと' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと保存できないこと' do
      @order_form.postal_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end    
    it '都道府県が選択されていないと保存できないこと' do
      @order_form.prefecture_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include()
    end
    it '市区町村が空だと保存できないこと' do
      @order_form.municipality = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_form.house_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("House number can't be blank")
    end
    it '建物名は空でも保存できること' do
      @order_form.building_name = nil
      expect(@order_form).to be_valid
    end    
    it '電話番号が空だと保存できないこと' do
      @order_form.telephone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
    end
    it '電話番号が全角数字だと保存できないこと' do
      @order_form.telephone_number = '０９０１２３４５６７８'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Telephone number is invalid. Input half-width characters.")
    end    
      
  end
end
