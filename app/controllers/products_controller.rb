class ProductsController < ApplicationController
  before_action :check_login

  def index
    @user = session[:user]
    @region = session[:region]
    @products = ProductService.get(session)
    @cart = CartService.get_cart(session)
  end
end
