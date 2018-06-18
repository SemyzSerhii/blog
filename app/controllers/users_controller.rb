class UsersController < ApplicationController

  before_action :find_user, only: %i[show edit update destroy]

  # def index
  #   @users = User.all
  # end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
     if @user.save
       redirect_to({ action: :index }, notice: 'Signed up!')
     else
       render :new
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end


  def users_params
    params.require(:user).permit(:username, :password)
  end
end


