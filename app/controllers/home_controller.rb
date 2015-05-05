class HomeController < ApplicationController
  around_filter :shopify_session
  layout 'embedded_app'

  def index
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    @shop = ShopifyAPI::Shop.current.domain
    @counters = Counter2.select("count(productId) as productCount,productId, shopName").where("shopName = '#{@shop}'").group("productId")
  end

end
