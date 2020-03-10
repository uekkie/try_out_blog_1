class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all.order(:name)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_url
    else
      render :edit
    end
  end

  def profile
    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :blog_url)
  end
end
