require 'rails_helper'

describe "Merchants API" do
  it "sends a list of items for a specific merchant" do
    @merchant = create(:merchant)
    @items = create_list(:item, 20, merchant_id: @merchant.id)

    get "/api/v1/merchants/#{@merchant.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.count).to eq(20)

    items.each_with_index do |item, index|
      expect(item).to have_key(:id)
      expect(item[:id]).to be_an(Integer)
      expect(item[:id]).to eq(@items[index].id)

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
end
