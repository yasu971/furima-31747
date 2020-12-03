require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '住所情報の保存' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    it 'すべての値が正しく入力されていれば保存できること' do

    end
    it '郵便番号が空だと保存できないこと' do

    end
    it '市区町村が空だと保存できないこと' do

    end
    it '番地が空だと保存できないこと' do
    end
    


  end
end
