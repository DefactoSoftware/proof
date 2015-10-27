class RequirementsController < ApplicationController
  def index
    @requirements = Requirement.all
    @requirement = Requirement.new
  end

  def create
    Requirement.create new_requirement_params
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

  def new_requirement_params
    params.require(:requirement).
      permit(:title, :description, :within_months)
  end
end
