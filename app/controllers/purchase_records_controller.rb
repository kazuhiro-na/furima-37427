class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  def index
    @record_address = RecordAddress.new
    redirect_to root_path if @item.purchase_record.present? || @item.user_id == current_user.id
  end

  def create
    @record_address = RecordAddress.new(record_address_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_address_params
    params.require(:record_address).permit(:tell, :postal_code, :prefecture_id, :municipalities, :address, :building).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_address_params[:token],
      currency: 'jpy'
    )
  end
end
