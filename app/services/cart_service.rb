class CartService
  def self.add_product(session, product_id, quantity = 1)
    options = { headers: { Authorization: session[:token] } }
    response = HTTParty.get("http://127.0.0.1:3000/cart/add_product/#{product_id}/#{quantity}", options)
    response.parsed_response
  end

  def self.remove_product(session, product_id)
    options = { headers: { Authorization: session[:token] } }
    response = HTTParty.delete("http://127.0.0.1:3000/cart/remove_product/#{product_id}", options)
    response.parsed_response
  end

  def self.update_product(session, product_id, quantity)
    options = { headers: { Authorization: session[:token] } }
    response = HTTParty.put("http://127.0.0.1:3000/cart/update_product/#{product_id}/#{quantity}", options)
    response.parsed_response
  end

  def self.get_cart(session)
    options = { headers: { Authorization: session[:token] } }
    response = HTTParty.get('http://127.0.0.1:3000/cart/', options)
    response.parsed_response
  end
end
