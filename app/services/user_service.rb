class UserService
  def self.get_user(params)
    options = { headers: { Authorization: params[:token] } }
    response = HTTParty.get("http://127.0.0.1:3000/users/#{params[:user_id]}", options)
    response.parsed_response.with_indifferent_access
  end

  def self.get_regions
    response = HTTParty.get("http://127.0.0.1:3000/regions")
    response.parsed_response
  end

  def self.login(email, password)
    options = {
      query: {
        user: {
          email: email,
          password: password
        }
      }
    }
    response = HTTParty.post('http://127.0.0.1:3000/users/login', options).parsed_response.with_indifferent_access
  end

  def self.register(params)
    options = {
      query: {
        user: {
          name: params[:name],
          email: params[:email],
          password: params[:password],
          password_confirmation: params[:password_confirmation],
          region_id: params[:region_id]
        }
      }
    }
    response = HTTParty.post('http://127.0.0.1:3000/users', options).parsed_response.with_indifferent_access
  end
end