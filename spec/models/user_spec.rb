require 'rails_helper'
 RSpec.describe User, type: :model do
   describe 'ユーザー新規登録' do
    
     it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = "" 
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
     end

     it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = "" 
      user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
      end

     it "passwordが空では登録できない" do  
      user = FactoryBot.build(:user)
      user.password = "" 
      user.valid?
       expect(user.errors.full_messages).to include("Password can't be blank")
     end
     
     it"名字が空では登録できない" do
      user = FactoryBot.build(:user)
      user.last_name = "" 
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    
     it"名前が空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = "" 
      user.valid?
       expect(user.errors.full_messages).to include("First name can't be blank")
     end

     it"名字（カナ）が空では登録できない" do
      user = FactoryBot.build(:user)
      user.last_name_kana = "" 
      user.valid?
       expect(user.errors.full_messages).to include("Last name kana can't be blank")
     end

     it"名前（カナ）が空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = "" 
      user.valid?
       expect(user.errors.full_messages).to include("First name kana can't be blank")
     end

     it"誕生日が空では登録できない" do
      user = FactoryBot.build(:user)
      user.birth_day = "" 
      user.valid?
       expect(user.errors.full_messages).to include("Birth day can't be blank")
     end 
   end
 end
