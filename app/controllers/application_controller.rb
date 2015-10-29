class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def should_be_manager
    unless current_user.manager
      flash[:error] = "You have to be Manager to do that"
      redirect_to root_url
    end
  end
end
