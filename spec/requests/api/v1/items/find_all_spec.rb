require 'rails_helper'

RSpec.describe 'Find all items API' do
  it 'finds all items' do
    Merchant.destroy_all
    Item.destroy_all
    merchant = create(:merchant)
    items = create_list(:item, 50)
    item = items.sample
    item_count = Item.where(name: item.name).count
    get "/api/v1/items/find_all?name=#{item.name}"
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq 200
    expect(parsed).to be_a Hash
    expect(parsed[:data][0][:attributes][:name]).to eq(item.name)
    expect(parsed[:data].size).to eq(item_count)
  end
end
