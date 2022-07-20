require 'rails_helper'

RSpec.describe MerchantsService do
  it '#get_merchants retrieves data and parses response', :vcr do
    parsed_json = MerchantsService.get_merchants
    expect(parsed_json).to be_a Array
    merchant = parsed_json.first
    expect(merchant).to be_a Hash
    expect(merchant[:attributes]).to include :name
    expect(merchant[:attributes][:name]).to be_a String
  end
end
