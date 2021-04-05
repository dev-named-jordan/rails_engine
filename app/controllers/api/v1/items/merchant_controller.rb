class Api::V1::Items::MerchantController < ApplicationController
  def index
    item = Item.find(params[:id])
    render json: Merchant.find(item.merchant_id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :unit_price, :merchant_id, :description)
  end
end
