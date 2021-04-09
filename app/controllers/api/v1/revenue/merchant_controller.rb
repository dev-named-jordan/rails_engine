class Api::V1::Revenue::MerchantController < ApplicationController
  def show
    # require "pry"; binding.pry
    # if !Merchant.find(params[:id]) && (!Merchant.find(params[:id]).blank? || Merchant.find(params[:id]).nil?)
    merchant = Merchant.find(params[:id])
    if merchant.nil?
      render json: { data: {} }, status:404
    else
      merchant = Merchant.find(params[:id])
      # require "pry"; binding.pry
      merchant_revenue = merchant.total_revenue
      render json: MerchantSerializer.new(merchant)
    end
  end
end
