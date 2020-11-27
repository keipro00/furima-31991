require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do

# FactoryBotの値が入らない？？
    context "商品出品機能がうまくいくとき" do
      it "必要な情報を入力すれば投稿できる" do
        expect(@item).to be_valid
      end
    end
  
    context '商品出品機能がうまくいかないとき' do
      it '商品名が必須である' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品画像を1枚つけることが必須である' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'カテゴリーの情報が必須である' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category is not a number'
      end

      it 'カテゴリーの情報に--が入っていると登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it '商品の状態についての情報が必須である' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Status is not a number"
      end

      it '商品の状態に--が入っていると登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end

      it '配送料の負担についての情報が必須である' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery fee is not a number'
      end

      it '配送料の負担について--が入っていると登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
      end


      it '発送元の地域についての情報が必須である' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture is not a number"
      end

      it '発送元の地域について--が入っていると登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it '発送日の日数についての情報が必須である' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day is not a number"
      end

      it '発送元の地域について--が入っていると登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include  "Delivery day must be other than 1"
      end

      it '価格についての情報が必須である' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include  "Price 販売価格は、300円〜9,999,999円の間である"
      end

      it '価格が10,000,000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include  "Price 販売価格は、300円〜9,999,999円の間である"
      end

      it '価格が半角数字のみ保存可能' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price 販売価格は、300円〜9,999,999円の間である"
      end
    end
  end
end
