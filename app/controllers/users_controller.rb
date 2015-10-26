class UsersController < ApplicationController
  skip_before_filter :authenticate!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = t("registrations.user.success")
      redirect_to :root
    end
  end

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password)
  end
end
