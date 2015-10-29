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
      @evidence_history = EvidenceHistory.new
      @evidence_history.description = @evidence.description
      @evidence_history.modifier = @evidence.user
      @evidence_history.valid_until = @evidence.valid_until
      @evidence_history.evidence = @evidence
      if @evidence_history.save
        redirect_to requirements_path
      end
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
      @evidence_history = EvidenceHistory.new
      @evidence_history.evidence = @evidence
      @evidence_history.description = @evidence.description
      @evidence_history.modifier = current_user
      if @evidence_history.save
        redirect_to requirements_path
      end
    else
      render "edit"
    end
  end

  def approve
    @evidence = current_evidence
    @evidence.approved = true
    @evidence.approver = current_user
    save_evidence_history
  end

  def disapprove
    @evidence = current_evidence
    @evidence.approver = current_user
    @evidence.approved = false
    save_evidence_history
  end

  private

  def current_evidence
    Evidence.find(params[:id])
  end

  def current_requirement
    Requirement.find(params[:requirement_id])
  end

  def save_evidence_history
    if @evidence.save
      @evidence_history = EvidenceHistory.new
      @evidence_history.approved = @evidence.approved
      @evidence_history.evidence = @evidence
      @evidence_history.approver = current_user
      @evidence_history.modifier = current_user

      if @evidence_history.save
        redirect_to evidences_path
      end
    end
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
      flash[:error] = "You can't approve or disapprove your own evidence"
      redirect_to evidences_path
    end
  end
end
