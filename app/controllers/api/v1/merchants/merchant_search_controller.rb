class Api::V1::Merchants::MerchantSearchController < ApplicationController
  def index
    # require "pry"; binding.pry
    merchant = Merchant.where('name ILIKE ?', "%#{params[:name]}%").order(:name).first
    if ((merchant.class == NilClass) || (merchant == []))
      render json: { data: {} }, status:404
    else
      render json: MerchantSerializer.new(merchant)
    end
  end
end
