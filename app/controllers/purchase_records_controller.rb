class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_record = PurchaseRecord.create(purchase_record_params)
    ShippingAddress.create(shipping_address_params)
    redirect_to root_path
  end

  private
  
  def purchase_record_params
    params.permit(:tell).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def shipping_address_params
    params.permit(:postal_code, :prefecture_id, :municipalities, :address, :building).merge(purchase_record_id: @purchase_record.id)
  end
end
