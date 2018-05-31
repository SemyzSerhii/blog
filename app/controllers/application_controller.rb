# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.first
  end
end
