require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品の購入機能' do
     context '購入できる場合' do
       it '購入時に建物名以外の項目が埋まっていれば購入できる' do
         expect(@order_address).to be_valid
       end

       it '購入時に建物名の項目が埋まっていなくても購入できる' do
         expect(@order_address).to be_valid
       end
     end


    context 'できない場合' do

      it '郵便番号の記入がない場合は購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end

      it '郵便番号の-(ハイフン)がなければ購入できない' do
        @order_address.postal_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it '都道府県の情報がなければ購入できない' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Area can't be blank"
      end

      it 'area_idに1が選択されている場合は購入できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Area can't be blank"
      end

      it '市区町村の記入がなければ購入できない' do
        @order_address.from_city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "From city can't be blank"
      end

      it '番地の記入がなければ購入できない' do
        @order_address.from_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "From address can't be blank"
      end

      it '電話番号の記入がなければ購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it '電話番号は11桁の数字でなければ購入できない' do
        @order_address.phone_number = 'abeou'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it "tokenが空では購入できないこと" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
