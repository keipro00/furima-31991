class UserItemsController < ApplicationController
    # ログアウトユーザーはログイン画面へ
    before_action :authenticate_user!, only: [:index]
    before_action :move_to_index, only:[:index, :create, :user_item_params]
  
    def index
      redirect_to root_path if current_user.id == @item.user_id
      @item_form = ItemForm.new
    end
  
    def create
      binding.pry
      @item_form = ItemForm.new(user_item_params)
      if @item_form.valid?
        pay_item 
        @item_form.save
        return redirect_to root_path
      else
        render :index
      end
    end
  
  
  private 
  def pay_item
    # Payjp.api_key = "sk_test_5d0815d0907b4e53ae2dfe23"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    # 秘密鍵を代入した環境変数を呼び込む
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: user_item_params[:price],  # 商品の値段
      card: user_item_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  
  def user_item_params  
     params.require(:item_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
    end

  def move_to_index
      @item = Item.find(params[:item_id])
  end
end