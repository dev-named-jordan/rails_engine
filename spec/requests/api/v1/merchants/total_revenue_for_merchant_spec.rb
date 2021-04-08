require 'rails_helper'

RSpec.describe 'Total revenue for merchant' do
  it 'Returns error if no merchant' do
    get '/api/v1/revenue/merchants/Mad;alfd23r2i9'

    expect(response).to_not be_successful
    expect(response.status).to eq 404
  end
end
