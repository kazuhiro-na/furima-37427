class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(purchase_record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_record_params
    params.require(:record_address).permit(:tell, :postal_code, :prefecture_id, :municipalities, :address, :building).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
