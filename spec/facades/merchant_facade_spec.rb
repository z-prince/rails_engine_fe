require 'rails_helper'

RSpec.describe 'MerchantFacade' do
  describe 'index page calls' do
    it 'returns all merchants names as links', :vcr do
      results = MerchantsFacade.merchants  # set to variable to decrease number of api and/or cassette calls
      expect(results).to be_a Array
      expect(results).to be_all Merchant
    end
  end
end
