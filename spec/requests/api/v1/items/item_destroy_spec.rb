require 'rails_helper'

describe "Items API" do
  it "can destroy an existing item" do
    Merchant.destroy_all
    Item.destroy_all
    merchant = create(:merchant)
    item = create(:item)

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
    it "can destroy an existing item" do
      Merchant.destroy_all
      Item.destroy_all
    item = create(:item)

    expect{ delete "/api/v1/items/#{item.id}" }.to change(Item, :count).by(-1)

    expect(response).to be_success
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
