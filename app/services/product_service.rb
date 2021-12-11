class ProductService
  def self.get(session)
    options = { headers: { Authorization: session[:token] } }
    response = HTTParty.get("http://127.0.0.1:3000/products/#{session[:user]['region_id']}", options)
    response.parsed_response
  end
end
