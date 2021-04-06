class Api::V1::Items::MerchantController < ApplicationController
  def index
    item = Item.find(params[:id])
    merchant = Merchant.find(item.merchant_id)
    render json: MerchantSerializer.new(item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :unit_price, :merchant_id, :description)
  end
end
