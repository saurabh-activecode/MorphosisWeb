class ApplicationController < ActionController::Base
  private
  def check_login
    unless session[:user].present?
      redirect_to new_users_path
    end
  end
end
