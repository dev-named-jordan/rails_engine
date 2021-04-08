require 'rails_helper'

describe "Items API" do
  it "sends a list of all items" do
    Merchant.destroy_all
    Item.destroy_all
    @merchant = create(:merchant)
    @items = create_list(:item, 20, merchant_id: @merchant.id)

    get "/api/v1/items"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].count).to eq(20)

    items[:data].each_with_index do |item, index|

      # expect(item[:data]).to have_key(:id)
      # expect(item[:data][:id]).to be_an(Integer)
      # expect(item[:data][:id]).to eq(@items[index].id)

      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a(String)

      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_a(Float)

      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_a(String)

      expect(item[:attributes]).to have_key(:merchant_id)
      expect(item[:attributes][:merchant_id]).to be_a(Integer)
    end
  end
  it "sends a list of all items" do
    Merchant.destroy_all
    Item.destroy_all
    @merchant = create(:merchant)
    @items = []

    get "/api/v1/items"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    expect(items[:data].count).to eq(0)
  end
end
