class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explantion, :category_id, :condition_id, :burden_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
