require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do

context '新規登録が上手くいくとき' do

  it "パスワードは６文字以上である、パスワードは半角英数字混合である" do
    @user.password = "hoge1234"
    @user.password_confirmation = "hoge1234"
    expect(@user).to be_valid 
  end

  it "メールアドレスは＠を含む必要がある" do
    @user.email = "test@example" 
    expect(@user).to be_valid
  end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）で入力させる" do
     @user.last_name = "手すト" 
     expect(@user).to be_valid
  end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）で入力させる" do
     @user.first_name = "子おド" 
     expect(@user).to be_valid
  end
    
    it "ユーザー本名のフリガナは、全角（カタカナ）で入力させる" do
     @user.last_name_kana = "テスト" 
     expect(@user).to be_valid
  end

    it "ユーザー本名のフリガナは、全角（カタカナ）で入力させる" do
    @user.first_name_kana = "コード" 
    expect(@user).to be_valid
  end 
end
  
  context '新規登録が上手くいかないとき' do
  
    it "パスワードは確認用を含めて２回入力する" do
     @user.password = "hoge1234"
     @user.password_confirmation = "hoge12345"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
   
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