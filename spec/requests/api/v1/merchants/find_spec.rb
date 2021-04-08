require 'rails_helper'

RSpec.describe 'Find one Merchant API' do
  it 'finds one merchant' do
    Merchant.destroy_all
    Item.destroy_all
    Merchant.destroy_all
    merchants = create_list(:merchant, 200)
    merchant = merchants.sample

    get "/api/v1/merchants/find?name=#{merchant.name}"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq 200
    expect(parsed).to be_a Hash
    expect(parsed[:data][:attributes][:name]).to eq(merchant.name)
    #trying to test only one merchant is being passed, when more than one, this is an array
    expect(parsed[:data]).to be_a Hash
    expect(parsed[:data]).not_to be_a Array
  end
  it 'finds no merchant' do
    Merchant.destroy_all
    Item.destroy_all
    Merchant.destroy_all
    merchants = create_list(:merchant, 100)
    merchant = merchants.sample

    get "/api/v1/merchants/find?name=thisshouldnotexit"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 404
    expect(parsed).to be_a Hash
  end
end
