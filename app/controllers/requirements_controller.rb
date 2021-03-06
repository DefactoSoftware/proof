class RequirementsController < ApplicationController
  before_action :require_login
  before_action :should_be_manager, except: [:index, :show]
  helper_method :evidence_for_user_and

  def index
    @requirements = Requirement.all
    @requirement = Requirement.new
  end

  def show
    @requirement = current_resource
    @approved_evidences = @requirement.evidences.where( approved: true )
  end

  def new
    @requirement = Requirement.new
  end

  def create
    @requirement = Requirement.new requirement_params

    if @requirement.valid?
      @requirement.save!
      redirect_to requirements_path
    else
      render :new
    end
  end

  def edit
    @requirement = current_resource
  end

  def update
    current_resource.update! requirement_params
    redirect_to requirements_path
  end

  def destroy
    current_resource.destroy
    redirect_to requirements_path
  end

  def assign
    @user_requirement = UserRequirement.find_or_initialize_by(
      user_id: params[:user_id],
      requirement_id: params[:id]
    )

    if @user_requirement.new_record?
      @user_requirement.save
    else
      @user_requirement.destroy!
    end

    redirect_to user_path(id: params[:user_id])
  end

  def evidence_for_user_and(requirement)
    return requirement.evidences.where(user: current_user).first
  end

  private

  def current_resource
    @requirement ||= Requirement.find(params[:id])
  end

  def requirement_params
    params.require(:requirement).
      permit(:title, :description, :within_months)
  end
end
