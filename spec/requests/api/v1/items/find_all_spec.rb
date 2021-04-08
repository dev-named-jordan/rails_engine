require 'rails_helper'

RSpec.describe 'Find all items API' do
  it 'finds all items by name' do
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
  describe 'Item API' do
    before :each do
      Merchant.destroy_all
      Item.destroy_all
      @merchant = create(:merchant)
      @items_1 = create_list(:item, 10, unit_price: 50.00, merchant_id: @merchant.id)
      @items_2 = create_list(:item, 10, unit_price: 75.00, merchant_id: @merchant.id)
      @items_3 = create_list(:item, 10, unit_price: 100.00, merchant_id: @merchant.id)
      @items_4 = create_list(:item, 10, unit_price: 200.00, merchant_id: @merchant.id)
      @items_5 = create_list(:item, 10, unit_price: 499.00, merchant_id: @merchant.id)
      @items_6 = create_list(:item, 10, unit_price: 550.00, merchant_id: @merchant.id)
      @items_7 = create_list(:item, 10, unit_price: 650.00, merchant_id: @merchant.id)
      @items_8 = create_list(:item, 10, unit_price: 750.00, merchant_id: @merchant.id)
    end
    it 'finds all items with price greater than or equal to x, then less than or equal to x, then find all items in between min/max prices, Then error for price and name together' do

      get "/api/v1/items/find_all?min_price=99"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(parsed).to be_a Hash
      expect(parsed[:data].count).to be == 60

      get "/api/v1/items/find_all?min_price=701"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(parsed).to be_a Hash
      expect(parsed[:data].count).to be == 10
    end
    it 'Finds all over max_price = 701' do

      get "/api/v1/items/find_all?max_price=701"

      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(parsed).to be_a Hash
      expect(parsed[:data].count).to be == 70
    end
    it 'Can get max price of 99' do
      get "/api/v1/items/find_all?max_price=99"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(parsed).to be_a Hash
      expect(parsed[:data].count).to be == 20
    end
    it 'More cases' do
      get "/api/v1/items/find_all?max_price=599"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(parsed).to be_a Hash
      expect(parsed[:data].count).to be == 60

      get "/api/v1/items/find_all?min_price=201"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(parsed).to be_a Hash
      expect(parsed[:data].count).to be == 40

      get "/api/v1/items/find_all?min_price=201&max_price=599"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(parsed).to be_a Hash
      expect(parsed[:data].count).to be == 20

      get "/api/v1/items/find_all?min_price=99&max_price=701"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(parsed).to be_a Hash
      expect(parsed[:data].count).to be == 50

      get "/api/v1/items/find_all?min_price=301&max_price=701"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(parsed).to be_a Hash
      expect(parsed[:data].count).to be == 30
    end
  end
end
