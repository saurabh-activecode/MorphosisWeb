class ProductsController < ApplicationController
  before_action :check_login

  def index
    @products = ProductService.get(session)
    @cart = CartService.get_cart(session)
  end
end
