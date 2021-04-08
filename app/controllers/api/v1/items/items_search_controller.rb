class Api::V1::Items::ItemsSearchController < ApplicationController
  def index

    def json_404
      render json: { data: {} }, status: 404
    end

    if ((params[:name].nil?) || (params[:name] == [] || !params[:name])) && (!params[:min_price] && !params[:max_price])
      #no data
      json_404
    elsif (!params[:name].blank?) && (params[:min_price] || params[:max_price])
      #too much data
      render json: { data: "Too many search parameters" }, status: :bad_request
    elsif (params[:min_price] && params[:max_price]) && (params[:name].blank?)
      item = Item.where("unit_price >= ?", params[:min_price]).where("unit_price <= ?", params[:max_price]).order(:name)
      #both price params
      render json: ItemSerializer.new(item)
    elsif params[:min_price] && !params[:max_price]
      #only min price
      item = Item.where("unit_price >= ?", params[:min_price]).order(:name)
      render json: ItemSerializer.new(item)
    elsif params[:max_price] && !params[:min_price]
      #only max price
      item = Item.where("unit_price <= ?", params[:max_price]).order(:name)
      render json: ItemSerializer.new(item)
    elsif params[:name] && (!params[:min_price] && !params[:max_price])
      # by name fragment
      item = Item.where('name ILIKE ?', "%#{params[:name]}%").order(:name)
      render json: ItemSerializer.new(item)
    end
  end
end
