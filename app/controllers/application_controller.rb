class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or request_with_http_basic do |username, password|
      userame == 'admin' && password == '2222'
    end
  end
end
