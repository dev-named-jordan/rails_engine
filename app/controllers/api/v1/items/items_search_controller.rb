class Api::V1::Items::ItemsSearchController < ApplicationController
  def index
    item = Item.where('name ILIKE ?', "%#{params[:name]}%").order(:name)

    render json: ItemSerializer.new(item)
  end
end
