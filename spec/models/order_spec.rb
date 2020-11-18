require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入機能の保存' do
    before do
      buyer = FactoryBot.create(:user)
      seller = FactoryBot.create(:user)
      item = FactoryBot.build(:item, user_id: seller.id)
      item.save
      @order = FactoryBot.build(:order, user_id:buyer.id, item_id: item.id)
      sleep(1)
    end

    context '購入がうまく行く時' do
      it '全ての値とtokenが正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    context '購入がうまくいかない時' do
      it '郵便番号が空だと保存できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が半角のハイフンを含め正しい形式でないと保存できない' do
        @order.postal_code = 1111111
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県を選択しないと保存できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
  
      it '市区町村が空だと選択できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空だと保存できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
