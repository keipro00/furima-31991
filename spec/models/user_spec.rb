require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do

context '新規登録が上手くいくとき' do
  # パスワードは６文字以上が必要
  # パスワードは半角英字混合である
  it "passwordが6文字以上であれば登録できること" do
    @user.password = "hoge1234"
    @user.password_confirmation = "hoge1234"
    expect(@user).to be_valid 
  end

  # メールに＠があると登録できる
  it "emailに＠があると登録できる" do
    @user.email = "test@example" 

    expect(@user).to be_valid
  end

  # 名前は全角（漢字・ひらがな・カタカナ）で入力
    it"名字が空では登録できない" do
     @user.last_name = "手すト" 
     expect(@user).to be_valid
  end
   # 名前は全角（漢字・ひらがな・カタカナ）で入力
    it"名前は全角で入力する" do
     @user.first_name = "子おド" 
     expect(@user).to be_valid
  end
end
  
  context '新規登録が上手くいかないとき' do
   # パスワードは２回確認が必要
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
     @user.password = "123456"
     @user.password_confirmation = "1234567"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
   # メールは一意性である
    it "重複したemailが存在する場合登録できないこと" do
     @user.save
     another_user = FactoryBot.build(:user, email: @user.email)
     another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
   end

    it "nicknameが空だと登録できない" do
     @user.nickname = "" 
     @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
   end
   
     it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
     
     it"名字が空では登録できない" do
      @user.last_name = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
     it"名前が空では登録できない" do
      @user.first_name = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

     it"名字（カナ）が空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

     it"名前（カナ）が空では登録できない" do
      @user.first_name_kana = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it"誕生日が空では登録できない" do
      @user.birth_day = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
     end 
   end
  end
end
