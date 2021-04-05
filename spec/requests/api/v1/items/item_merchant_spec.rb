require 'rails_helper'

describe "Items API" do
  it "can get one item by its id, and display it's merchant data" do
    @merchant = create(:merchant)
    @item = create(:item, merchant_id: @merchant.id)

    get "/api/v1/items/#{@item.id}/merchant"

    merchant_parse = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(merchant_parse).to have_key(:id)
    expect(merchant_parse[:id]).to be_an(Integer)

    expect(merchant_parse).to have_key(:name)
    expect(merchant_parse[:name]).to be_an(String)
  end
end
