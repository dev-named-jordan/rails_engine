class Api::V1::Items::MerchantController < ApplicationController
  def index
    require "pry"; binding.pry
    item = Item.find(params[:id])
    merchant = Merchant.find(item.merchant_id)
    render json: MerchantSerializer.new(item)
    render json: MerchantSerializer.new(Merchant.all.limit(query_size).offset(page_offset))
  end

  private

  def item_params
    params.require(:item).permit(:name, :unit_price, :merchant_id, :description)
  end
end
