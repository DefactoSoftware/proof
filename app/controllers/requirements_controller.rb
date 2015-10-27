class RequirementsController < ApplicationController
  before_action :require_login
  def index
    @requirements = Requirement.all
    @requirement = Requirement.new
  end

  def create
    Requirement.create requirement_params
    redirect_to requirements_path
  end

  def edit
    @requirement = current_resource
  end

  def update
    current_resource.update! requirement_params
    redirect_to requirements_path
  end

  def destroy
    current_resource.delete
    redirect_to requirements_path
  end

  private
  def current_resource
    Requirement.find(params[:id])
  end

  def requirement_params
    params.require(:requirement).
      permit(:title, :description, :within_months)
  end
end
