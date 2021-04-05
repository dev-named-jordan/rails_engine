require 'rails_helper'

describe "Items API" do
  it "can get one item by its id" do
    @merchant = create(:merchant)
    @item = create(:item, merchant_id: @merchant.id)

    get "/api/v1/items/#{@item.id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data]).to have_key(:id)
    # require "pry"; binding.pry
    expect(item[:data][:id]).to be_an(String)

    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes][:name]).to be_a(String)

    expect(item[:data][:attributes]).to have_key(:unit_price)
    expect(item[:data][:attributes][:unit_price]).to be_a(Float)

    expect(item[:data][:attributes]).to have_key(:description)
    expect(item[:data][:attributes][:description]).to be_a(String)

    expect(item[:data][:attributes]).to have_key(:merchant_id)
    expect(item[:data][:attributes][:merchant_id]).to be_a(Integer)
  end
end
