require 'rails_helper'

RSpec.describe 'Total revenue for merchant' do
  describe 'Can get total revenue for a merchant' do
    before :each do
      Merchant.destroy_all
      Item.destroy_all
      InvoiceItem.destroy_all
      merchants = create_list(:merchant, 20)
      @merchant = merchants.sample

      @items = create_list(:item, 10, unit_price: 50.00, merchant_id: @merchant.id)
      @item_sample = @items.sample

      @invoice_items_1 = create_list(:invoice_item, 10, unit_price: 250.00, quantity: 2, item_id: @item_sample.id)
      @invoice_items_2 = create_list(:invoice_item, 10, unit_price: 500.00, quantity: 2, item_id: @item_sample.id)
    end
    it 'Returns error if no merchant' do

      get '/api/v1/revenue/merchants/Mad;alfd23r2i9'

      expect(response).to_not be_successful
      expect(response.status).to eq 404
    end
    it 'Returns a merchants total_revenue' do

      get "/api/v1/revenue/merchants/#{@merchant.id}"

      expect(response).to be_successful
      expect(response.status).to eq 200
    end
  end
end
