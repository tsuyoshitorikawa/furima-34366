class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @order_address
  end


  def create
      @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_order_address
      @order_address.save
        redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :area_id, :from_city, :from_address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_order_address
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end
