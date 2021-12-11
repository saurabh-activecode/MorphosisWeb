class UsersController < ApplicationController
  # before_action :check_login, except: [:index, :login]

  def new
    @regions = UserService.get_regions
  end

  def login
    response = UserService.login(params[:email], params[:password])
    session[:token] = response[:token]
    session[:user] = UserService.get_user(response)
    session[:region] = UserService.get_region(session[:user]['region_id'])

    redirect_to products_path
  end

  def create
    response = UserService.register(params)
    reset_session
    redirect_to new_users_path, notice: 'User created'
  end

  def logout
    reset_session
    redirect_to new_users_path
  end
end
