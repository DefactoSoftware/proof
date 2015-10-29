class UsersController < Clearance::UsersController
  before_action :require_login, except: [:new, :create]
  before_action :only_yourself, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = current_resource
  end

  def edit
    @user = current_resource
  end

  def update
    user = current_resource
    user.update!(user_params)
    redirect_to user_path(user)
  end

  private
  def current_resource
    User.find(params[:id])
  end

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
    unless current_user == current_resource
      flash[:error] = "You're not allowed to do that"
      redirect_to root_url
    end
  end
end
