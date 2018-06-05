# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user2
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.first
  end



private

def current_user2
  @current_user2 ||= User.find(session[:user_id]) if session[:user_id]
end
end
