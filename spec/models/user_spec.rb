require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録が上手くいくとき' do
      it 'パスワードは英数字混合６文字以上である' do
        @user.password = 'hoge1234'
        @user.password_confirmation = 'hoge1234'
        expect(@user).to be_valid
      end

      it 'メールアドレスは＠を含むと登録できる' do
        @user.email = 'test@example'
        expect(@user).to be_valid
      end

      it 'ユーザー名字は、全角で入力する必要がある' do
        @user.last_name = '手すト'
        expect(@user).to be_valid
      end

      it 'ユーザー名前は、全角で入力する必要がある' do
        @user.first_name = '子おド'
        expect(@user).to be_valid
      end

      it 'ユーザー名字のフリガナは、全角（カタカナ）で入力させる' do
        @user.last_name_kana = 'テスト'
        expect(@user).to be_valid
      end

      it 'ユーザー名前のフリガナは、全角（カタカナ）で入力させる' do
        @user.first_name_kana = 'コード'
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'パスワードは確認用を含めて２回入力する' do
        @user.password = 'hoge1234'
        @user.password_confirmation = 'hoge12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは、半角英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailに＠を含む必要がある' do
        @user.email = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'ユーザー名字は全角で入力する必要がある' do
        @user.last_name = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it 'ユーザー名前は全角で入力する必要がある' do
        @user.first_name = 'ｺﾄﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it 'ユーザー名字フリガナは、全角（カタカナ）で入力する必要がある' do
        @user.last_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナ')
      end

      it 'ユーザー名前フリガナは、全角（カタカナ）で入力する必要がある' do
        @user.first_name_kana = 'こど'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナ')
      end

      it '名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名字（カナ）が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '名前（カナ）が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '誕生日が空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
