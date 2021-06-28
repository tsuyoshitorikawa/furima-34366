require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe 'ユーザー新規登録' do
     context '新規登録できるとき' do
       it '登録時に既存のタイトルが存在すれば登録できる' do
         expect(@user).to be_valid
       end
     end
   end
   context '新規登録できないとき' do
     it 'nameが空では登録できない' do
       @user.name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Name can't be blank"
     end

     it "emailがない場合は登録できないこと" do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
     end

     it '重複したemailが存在する場合登録できないこと' do
       @user.save
       another_user = FactoryBot.build(:user, email: @user.email)
       another_user.valid?
       expect(another_user.errors.full_messages).to include "Email has already been taken"
     end
     
     it "emailは、@を含まない場合登録できないこと" do
       @user.email = 'testtest'
       @user.valid?
       expect(@user.errors.full_messages).to include ('Email is invalid')
     end


     it "passwordがない場合は登録できないこと" do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Password can't be blank"
     end

     it 'passwordが5文字以下であれば登録できないこと' do
       @user.password = '12ab'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end

     it "passwordが半角数字のみだと登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end

     it "passwordが半角英字のみだと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end

     it "passwordは英数字混合でないと登録できない" do
      @user.password = "アイウエオ"
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end

      it "パスワードとパスワード（確認用）の値が一致しないと登録できない" do
        @user.password = '12345a'
        @user.password_confirmation = '23456b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

     it "first_nameがない場合は登録できないこと" do
       @user.first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "First name can't be blank"
     end

     it "last_nameがない場合は登録できないこと" do
       @user.last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Last name can't be blank"
     end

     it "名字のフリガナは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
       @user.first_name = "00000"
       @user.valid?
       expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
     end

     it "名前のフリガナは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
       @user.last_name = "00000"
       @user.valid?
       expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters."
     end

     it "first_name_kanaがない場合は登録できないこと" do
       @user.first_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "First name kana can't be blank"
     end

     it "last_name_kanaがない場合は登録できないこと" do
       @user.last_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Last name kana can't be blank"
     end

     it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
       @user.first_name_kana = "00000"
       @user.valid?
       expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters."
     end

     it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
       @user.last_name_kana = "00000"
       @user.valid?
       expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters."
     end

     it "birthdayがない場合は登録できないこと" do
       @user.birthday = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end

  end
end
