class MerchantsFacade
  def self.merchant(id)
    merchant = MerchantsService.get_merchant(id)
    Merchant.new(merchant)
  end

  def self.merchants
    merchants = MerchantsService.get_merchants
    merchants.map do |merchant|
      Merchant.new(merchant)
    end
  end

  def self.merchant_items(id)
    merchant_items = MerchantsService.get_merchant_items(id)
    merchant_items.map do |item|
      Item.new(item)
    end
  end
end
