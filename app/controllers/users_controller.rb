class UsersController < Clearance::UsersController
  before_action :require_login, except: [:new, :create]
  before_action :only_yourself, except: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to user_path(user)
  end

  private

  def user_from_params
    user_params = params[:user] || Hash.new
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :manager)
  end

  def only_yourself
    unless current_user == User.find(params[:id])
      flash[:error] = "You're not allowed to do that"
      redirect_to root_url
    end
  end
end
