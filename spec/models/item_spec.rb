require 'rails_helper'

RSpec.describe Item, type: :request do
  describe "Item paginate" do
    it "paginates merchants index" do
      @merchant = create(:merchant)
      @items = create_list(:item, 100, merchant_id: @merchant.id)

      get "/api/v1/items?page=1&per_page=20"

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)
# require "pry"; binding.pry
      expect(items[:data].count).to eq(20)
    end
  end
end
