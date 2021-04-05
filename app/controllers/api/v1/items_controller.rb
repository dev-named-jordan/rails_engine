class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  # def show_item_merchant
  #   item = Item.find(params[:id])
  #   render json: Merchant.find(item.merchant_id)
  # end

  def create
    render json: Item.create(item_params)
  end

  def update
    render json: Item.update(params[:id], item_params)
  end

  def destroy
    render json: Item.delete(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :unit_price, :merchant_id, :description)
  end
end
