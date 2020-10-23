require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do
      it 'nickname,email,password,encrypted_password,first_name,last_nama,first_name_kana,last_name_kana,birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上,半角英数字混合である' do
        @user.password = "000aaa"
        expect(@user).to be_valid
      end

      it 'passwordとencrypted_passwordが一致している' do
        @user.password = "000aaa"
        @user.encrypted_password = "000aaa"
        expect(@user).to be_valid
      end

      it 'first_name,last_name,first_name_kana,last_name_kanaは全角で入力' do
        @user.first_name = "東野"
        @user.last_name = "圭吾"
        @user.first_name_kana = "ヒガシノ"
        @user.last_name_kana = "ケイゴ"
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it 'emailが空だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank", "Email is invalid")
      end

      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以下だと登録できない' do
        @user.password = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'first_name,last_name,first_name_kana,last_name_kanaが空だと登録できない' do
        @user.first_name = ""
        @user.last_name = ""
        @user.first_name_kana = ""
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank", "Last name kana can't be blank", "First name kana can't be blank")
      end

      it 'first_name,last_name,first_name_kana,last_name_kanaが半角だと登録できない' do
        @user.first_name = "higashino"
        @user.last_name = "keigo"
        @user.first_name_kana = "ﾋｶﾞｼﾉ"
        @user.last_name_kana = "ｹｲｺﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid", "First name is invalid", "Last name kana is invalid", "First name kana is invalid")
      end

      it '生年月日が空だと登録できない' do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end