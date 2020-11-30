require 'rails_helper'
RSpec.describe ItemForm, type: :model do
  
  before do
    # binding.pry
    @item_form = FactoryBot.build(:item_form)
  end

  describe "商品購入情報の保存" do

   context "登録が上手くいくとき" do
     it '必要な情報が保存されると登録できる' do
      expect(@item_form).to be_valid
    end
 end

   context "登録が上手くいかないとき" do
    it "郵便番号は、空だと登録できない" do
      @item_form.postcode = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include "Postcode can't be blank", "Postcode 郵便番号はハイフンが必要"
    end

     it "郵便番号は、ハイフンが無いと登録できない" do
      @item_form.postcode = "1234567"
      @item_form.valid?
      expect(@item_form.errors.full_messages).to include "Postcode 郵便番号はハイフンが必要"
    end

     it "都道府県は--だと登録できない" do
        @item_form.prefecture_id = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include "Prefecture can't be blank", "Prefecture can't be blank"
     end

     it "市町村は空だと登録できない" do
      @item_form.city = nil
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include "City can't be blank"
     end

     it "電話番号は11桁以内でないと登録できない" do
      @item_form.phone = "12345678910111213"
      @item_form.valid?
      expect(@item_form.errors.full_messages).to include "Phone 電話番号は11桁以下かつハイフン不要"
     end

     it "電話番号はハイフンがあると登録できない" do
      @item_form.phone = "090-1234-56"
      @item_form.valid?
      expect(@item_form.errors.full_messages).to include "Phone 電話番号は11桁以下かつハイフン不要"
    end
   end
  end
end




