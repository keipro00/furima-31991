class UserItemsController < ApplicationController
    # ログアウトユーザーはログイン画面へ
    before_action :authenticate_user!, only: [:index]
    before_action :move_to_index, only:[:index, :create, :user_item_params]
  
    def index
      redirect_to root_path if current_user.id == @item.user_id
      @item_form = ItemForm.new
    end
    
    # includes使ってみたり、したがうまくいかず
    def create
      @item_form = ItemForm.new(user_item_params)
  
      if @item_form.valid?
         @item_form.save
        return redirect_to root_path
      else
        render :index
      end
    end
  
  private 
  def user_item_params  
     params.require(:item_form).permit(:postcode, :perfecture_id, :city, :block, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
    end

    def move_to_index
      @item = Item.find(params[:item_id])
    end


end

# .merge(token: params[:token])