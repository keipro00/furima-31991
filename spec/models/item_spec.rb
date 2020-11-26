require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
end
describe "商品出品機能" do
  
    context "商品出品機能がうまくいかないとき" do
    it "商品名が必須である" do
     @item.name = 1
     @item.valid?
     expect(@item.errors.full_messages).to include "Name can't be blank"

    end
    # it"商品画像を1枚つけることが必須である" do
      
    # end
    # it "カテゴリーの情報が必須である" do
      
    # end
    # it "商品の状態についての情報が必須である" do
      
    # end

    # it "配送料の負担についての情報が必須である" do
      
    # end

    # it "発送元の地域についての情報が必須である" do
      
    # end

  end
 end
end