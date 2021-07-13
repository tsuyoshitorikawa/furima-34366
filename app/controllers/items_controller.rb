class ItemsController < ApplicationController
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  
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
    @item.update(@item_params)
    redirect_to item_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  def item_params
    params.require(:item).permit(:image, :product_name, :description_name, :price, :area_id, :burden_id, :delivery_state_id, :category_id, :day_to_ship_id).merge(user_id: current_user.id)
  end

end
