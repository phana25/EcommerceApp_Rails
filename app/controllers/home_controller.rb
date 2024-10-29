class HomeController < ApplicationController
  allow_unauthenticated_access
  def index
    @main_products = Product.take(4)
  end
end
