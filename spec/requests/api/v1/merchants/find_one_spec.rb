require 'rails_helper'

describe "Merchants API" do
  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/find_one?name=#{Mart}"

    # merchant = JSON.parse(response.body, symbolize_names: true)
    #
    # expect(response).to be_successful
    # expect(merchant[:data]).to have_key(:id)
    # expect(merchant[:data][:id].to_i).to eq(id)
    #
    # expect(merchant[:data][:attributes]).to have_key(:name)
    # expect(merchant[:data][:attributes][:name]).to be_a(String)
  end
end
