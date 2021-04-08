class Api::V1::Revenue::MerchantController < ApplicationController
  # def index
  #   # require "pry"; binding.pry
  #   merchant = Merchant.where('name ILIKE ?', "%#{params[:name]}%").order(:name).first
  #   if ((merchant.class == NilClass) || (merchant == []))
  #     render json: { data: {} }, status:404
  #   else
  #     render json: MerchantSerializer.new(merchant)
  #   end
  # end

  def show
    # require "pry"; binding.pry
    if Merchant.where(id: params[:id]).empty?
      render json: { data: {} }, status:404
    else
      merchant = Merchant.find(params[:id])
      merchant_revenue = Merchant.total_revenue
      render json: MerchantSerializer.new(merchant)
    end
  end
end
