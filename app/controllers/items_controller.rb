class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :area_id, :state_id, :delivery_fee_id,
                                 :delivery_day_id, :image).merge(user_id: current_user.id)
  end
end
