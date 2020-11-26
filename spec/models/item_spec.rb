require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
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
        expect(@item.errors.full_messages).to include 'User must exist', 'Category is not a number'
      end

      it '商品の状態についての情報が必須である' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist', 'Status is not a number'
      end

      it '配送料の負担についての情報が必須である' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist', 'Delivery fee is not a number'
      end

      it '発送元の地域についての情報が必須である' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist', 'Prefecture is not a number'
      end

      it '価格についての情報が必須である' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が300円未満だと登録できない' do
        @item.price = 300
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end

      it '価格が10,000,000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end

      it '価格が半角数字のみ保存可能' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
