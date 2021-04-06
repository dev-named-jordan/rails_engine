class Api::V1::ItemsController < ApplicationController
  def index
    # require "pry"; binding.pry
    # items = Item.order(created_at: :desc).limit(20).offset(@page * 20)
    items = Item.all
    # require "pry"; binding.pry
    render json: ItemSerializer.new(items)
  end

  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item)
  end

  def create
    item = Item.create(item_params)
    render json: ItemSerializer.new(item)
  end

  def update
    item = Item.update(params[:id], item_params)
    render json: ItemSerializer.new(item)
  end

  def destroy
    render json: Item.delete(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :unit_price, :merchant_id, :description)
  end

  # def set_page
  #   @page = params[:page] || 0
  # end
end
