class Api::V1::Items::ItemsSearchController < ApplicationController
  def index
    items = Item.where('name ILIKE ?', "%#{params[:name]}%").order(:name)
    render json: ItemSerializer.new(items)
  end
end
