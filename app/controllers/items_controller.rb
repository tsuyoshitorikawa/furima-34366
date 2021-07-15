class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :contributor_confirmation, only: [:edit, :update]
  
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
    @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
  end

  def update
     @item = Item.find(params[:id])
     @item.update(item_params)
    if @item.save
     redirect_to item_path(item.id)
    else
     render :edit
    end
  end

  # def destroy
  #    @item = Item.find(params[:id])
  #    @item.destroy
  # end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description_name, :price, :area_id, :burden_id, :delivery_state_id, :category_id, :day_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def move_to_index
    unless user_signed_in? 
      redirect_to action: :index
    end
  end

end
