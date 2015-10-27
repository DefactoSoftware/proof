class RequirementsController < ApplicationController
  before_action :require_login
  def index
    @requirements = Requirement.all
    @requirement = Requirement.new
  end

  def create
    Requirement.create new_requirement_params
    redirect_to requirements_path
  end

  private

  def new_requirement_params
    params.require(:requirement).
      permit(:title, :description, :within_months)
  end
end
