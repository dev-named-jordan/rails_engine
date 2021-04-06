require 'rails_helper'

describe "Items API" do
  it "can get one item by its id, and display it's merchant data" do
    @merchant = create(:merchant)
    @item = create(:item, merchant_id: @merchant.id)

    get "/api/v1/items/#{@item.id}/merchant"

    merchant_parse = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(merchant_parse[:data]).to have_key(:id)
    expect(merchant_parse[:data][:id]).to be_an(String)

    expect(merchant_parse[:data][:attributes]).to have_key(:name)
    expect(merchant_parse[:data][:attributes][:name]).to be_an(String)
  end
end
