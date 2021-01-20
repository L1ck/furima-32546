class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = ItemOrder.find(params[:id])
    @item_order = ItemOrder.new
  end

  def new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      # pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def order_params
    params.require(:item_order).permit(:zip_code, :area_id, :city, :district, :building, :phone_number).merge(token: params[:token])
  end
end
