require 'rails_helper'

describe "Items API" do
  it "can create a new item" do
    Merchant.destroy_all
    Item.destroy_all
    merchant = create(:merchant)
    item_params = ({
        "name": "value1",
        "description": "value2",
        "unit_price": 100.99,
        "merchant_id": merchant.id
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)

    created_item = Item.last

    expect(response).to be_successful

    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.unit_price).to eq(item_params[:unit_price])
    expect(created_item.merchant_id).to eq(item_params[:merchant_id])
    expect(created_item.description).to eq(item_params[:description])
  end
end
