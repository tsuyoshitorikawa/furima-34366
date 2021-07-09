class ItemsController < ApplicationController
  def index
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

  def item_params
    params.require(:item).permit(:image, :product_name, :description_name, :price, :area_id, :burden_id, :delivery_state_id, :category_id, :day_to_ship_id).merge(user_id: current_user.id)
  end

end
