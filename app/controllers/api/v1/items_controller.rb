class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all.limit(query_size).offset(page_offset))
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
end
