class ItemsController < ApplicationController
  def index
  end

  def prototype_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
