class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only:[:show,:update]
  before_action :move_to_index, only:[:edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      render :show
    else
    render :edit
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :comment, :image, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
   @item = Item.find(params[:id])
  end
  
  def move_to_index
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id 
    elsif   user_signed_in? && current_user.id != @item.user_id
      redirect_to action: :index
    end
    
  end
 end
