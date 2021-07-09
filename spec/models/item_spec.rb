require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

   describe '商品の出品機能' do
     context '出品できる場合' do
       it '出品時に全項目が埋まっていれば出品できる' do
         expect(@item).to be_valid
       end
     end

     context 'できない場合' do
      it '商品画像付けなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名がなければ登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end

      it '商品の説明がなければ登録できない' do
        @item.description_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include  "Description name can't be blank"
      end

      it 'カテゴリーの情報がなければ登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態についての情報がなければ登録できない' do
        @item.delivery_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery state can't be blank"
      end

      it '配送料の負担についての情報がなければ登録できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden can't be blank"
      end

      it '発送元の地域についての情報がなければ登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end

      it '発送までの日数についての情報がなければ登録できない' do
        @item.day_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Day to ship can't be blank"
      end

      it '販売価格についての情報がなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '販売価格は299以下の場合は登録できない' do
        @item.price = 298
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end

      it '販売価格は10,000,000以上の場合は登録できない' do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end

      it '販売価格は全角数字では登録できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include  "Price is invalid"
      end
    end
  end
end
