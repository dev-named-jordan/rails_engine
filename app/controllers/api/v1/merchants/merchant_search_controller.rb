class Api::V1::Merchants::MerchantSearchController < ApplicationController
  def index
    merchant = Merchant.where('name ILIKE ?', "%#{params[:name]}%").order(:name)
    merchant.first
    render json: MerchantSerializer.new(merchant)
  end
end
