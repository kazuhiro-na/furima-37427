class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end
end
