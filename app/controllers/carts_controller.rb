class CartsController < ApplicationController
  def add_product
    CartService.add_product(session, params[:product_id])

    redirect_to '/products'
  end

  def remove_product
    CartService.remove_product(session, params[:product_id])

    redirect_to '/products'
  end

  def update_quantity
    quantity = params[:quantity].to_i
    if params[:type] == 'increase'
      quantity += 1
    elsif params[:type] == 'decrease'
      quantity -= 1
    end

    CartService.update_product(session, params[:product_id], quantity)

    redirect_to '/products'
  end
end
