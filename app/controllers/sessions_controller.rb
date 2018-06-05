class SessionsController < ApplicationController
  before_action :find_user, only: %i[show edit update]
  def show; end
  def new

  end

  def index
    @users = User.all
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to({ action: :index }, notice: 'Login up!')
    else
      flash.now.alert = 'Invalid email or password'
      render :new
    end
    end

    def destroy
      session[:user_id] = nil
      redirect_to({ action: :index }, notice: 'Logged out!')
    end
end

private

def find_user
  @user = User.find(params[:id])
end