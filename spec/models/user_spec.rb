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
        @user.password = '000aaa'
        expect(@user).to be_valid
      end

      it 'passwordとencrypted_passwordが一致している' do
        @user.password = '000aaa'
        @user.encrypted_password = '000aaa'
        expect(@user).to be_valid
      end

      it 'first_name,last_name,first_name_kana,last_name_kanaは全角で入力' do
        @user.first_name = '東野'
        @user.last_name = '圭吾'
        @user.first_name_kana = 'ヒガシノ'
        @user.last_name_kana = 'ケイゴ'
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以下だと登録できない' do
        @user.password = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'higashino'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_nameが半角だと登録できない' do
        @user.last_name = 'keigo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_name_kanaが半角だと登録できない' do
        @user.first_name_kana = 'ﾋｶﾞｼﾉ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'last_name_kanaが半角だと登録できない' do
        @user.last_name_kana = 'ｹｲｺﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it '生年月日が空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
