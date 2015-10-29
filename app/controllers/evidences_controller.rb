class EvidencesController < ApplicationController
  before_action :should_be_manager, only: [:approve, :disapprove]
  before_action :prevent_approving_own_evidence, only: [:approve, :disapprove]

  def index
    @evidences = Evidence.all
  end

  def show
    @evidence = current_evidence
  end

  def new
    @evidence = Evidence.new
    @evidence.requirement = current_requirement
  end

  def create
    @evidence = Evidence.new(evidence_params)
    @evidence.user = current_user
    @evidence.requirement = current_requirement
    @evidence.valid_until = valid_until_date(@evidence.requirement)

    if @evidence.save
      redirect_to requirements_path
    else
      render "new"
    end
  end

  def edit
    @evidence = current_evidence
  end

  def update
    @evidence = current_evidence
    if @evidence.update(evidence_params)
      redirect_to requirements_path
    else
      render "edit"
    end
  end

  def approve
    @evidence = current_evidence
    @evidence.approved = true
    @evidence.approver = current_user
    @evidence.save
    redirect_to evidences_path
  end

  def disapprove
    @evidence = current_evidence
    @evidence.approver = current_user
    @evidence.approved = false
    @evidence.save
    redirect_to evidences_path
  end

  private
  def current_evidence
    Evidence.find(params[:id])
  end

  def current_requirement
    Requirement.find(params[:requirement_id])
  end

  def evidence_params
    params.require(:evidence).permit(:description)
  end

  def valid_until_date(requirement)
    if requirement.within_months?
      Time.now + requirement.within_months.months
    end
  end

  def prevent_approving_own_evidence
    if current_user == current_evidence.user
      flash[:error] = "You're not allowed to do that"
      redirect_to evidences_path
    end
  end
end
