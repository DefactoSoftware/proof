class UserRequirementsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @requirements = Requirement.all
  end

  def create
    UserRequirement.create(params[:user_id], params[:requirement_id])
  end
end
