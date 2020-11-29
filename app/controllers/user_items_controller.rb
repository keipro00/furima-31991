class UserItemsController < ApplicationController
    # ログアウトユーザーはログイン画面へ
    before_action :authenticate_user!, only: [:index]
  
    def index
      #出品者はホーム画面へ遷移させる
      #売れていればホーム画面へ
      #出品者以外は、購入画面へ
      @item = Item.find(params[:item_id])
       if current_user.id == @item.user_id
          redirect_to root_path
       else 
         @item = Item.new
       end
    end
  
    def create
      # binding.pryで確認するとパラムスにデータが入っていない模様
      @user_item = user_item.new(user_item_params)
      if @user_item.valid?
        @user_item.save
        return redirect_to root_path
      else
        render :index
      end
    end
  
  private 
   def user_item_params
     params.require(:user_item).merge(user_id: current_user.id, item_id: params[:item_id])
   end
  end
  