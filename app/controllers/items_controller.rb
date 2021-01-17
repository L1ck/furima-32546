class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
  end

  private

  def image_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
