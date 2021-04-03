require 'rails_helper'

describe "Items API" do
  it "can get one item by its id" do
    @merchant = create(:merchant)
    @item = create(:item, merchant_id: @merchant.id)

    get "/api/v1/items/#{@item.id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(item).to have_key(:id)
    expect(item[:id]).to be_an(Integer)

    expect(item).to have_key(:name)
    expect(item[:name]).to be_a(String)

    expect(item).to have_key(:unit_price)
    expect(item[:unit_price]).to be_a(Float)

    expect(item).to have_key(:description)
    expect(item[:description]).to be_a(String)

    expect(item).to have_key(:merchant_id)
    expect(item[:merchant_id]).to be_a(Integer)
  end
end
