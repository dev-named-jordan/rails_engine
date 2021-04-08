class Api::V1::Merchants::MerchantSearchController < ApplicationController
  def index
    merchant = Merchant.where('name ILIKE ?', "%#{params[:name]}%").order(:name).first
    if ((merchant == []) || (merchant.class == NilClass))
      render json: { data: {} }, status:404
    else
      render json: MerchantSerializer.new(merchant)
    end
  end
end
