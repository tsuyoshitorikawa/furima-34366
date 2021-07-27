class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
      if current_user.id == @item.user_id || @item.order.present?
        redirect_to root_path
      end
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
      @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_order_address
      @order_address.save
        redirect_to root_path @item.order.blank?
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :area_id, :from_city, :from_address, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_order_address
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
