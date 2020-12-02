class UserItemsController < ApplicationController
    # ログアウトユーザーはログイン画面へ
    before_action :authenticate_user!, only: [:index]
    before_action :take_item, only:[:index, :create]
  
    def index
      if @item.user_item != nil
        redirect_to root_path 
      elsif current_user.id == @item.user_id
        redirect_to root_path
      else
        @item_form = ItemForm.new
      end
    end
  
    def create
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

  def take_item
      @item = Item.find(params[:item_id])
  end
end