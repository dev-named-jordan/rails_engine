require 'rails_helper'

RSpec.describe 'Find one Merchant API' do
  it 'finds one merchant' do
    Merchant.destroy_all
    merchants = create_list(:merchant, 50)
    merchant = merchants.sample
# require "pry"; binding.pry
    get "/api/v1/merchants/find?name=#{merchant.name}"
    # require "pry"; binding.pry

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq 200
    expect(parsed).to be_a Hash
    # require "pry"; binding.pry
    expect(parsed[:data][0][:attributes][:name]).to eq(merchant.name)
    expect(parsed.size).to eq(1)
  end
end
