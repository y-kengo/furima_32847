class OrdersController < ApplicationController
  before_action :authenticate_user!,only:[:index,:create]
  before_action :set_item, only:[:create,:index]
  before_action :move_to_index
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params) 
    if  @order_address.valid?
      pay
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
  params.require(:order_address).permit(:postal_code, :area_id, :city, :address, :building,:phone_number).merge(token: params[:token],item_id: params[:item_id],user_id: current_user.id)
  end

  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount:@item.price,
      card: order_params[:token],   
      currency: 'jpy'                
    ) 
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end

