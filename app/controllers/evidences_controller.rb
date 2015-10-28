class EvidencesController < ApplicationController
  def index
    @evidences = Evidence.all
  end

  def show
    @evidence = Evidence.find(params[:id])
  end

  def new
    @evidence = Evidence.new
  end

  def create
    @evidence = Evidence.new(evidence_params)
    @evidence.user = current_user
    @evidence.requirement = Requirement.find(params[:requirement_id])
    @evidence.valid_until = valid_until_date(@evidence.requirement)
    if @evidence.save
      redirect_to requirements_path
    else
      render 'new'
    end
  end

  def edit
    @evidence = Evidence.find(params[:id])
  end

  def update
    @evidence = Evidence.find(params[:id])
    if @evidence.update(evidence_params)
      redirect_to requirements_path
    else
      render 'edit'
    end
  end

  def approve
    @evidence = Evidence.find(params[:id])
    @evidence.approved = true
    @evidence.approver = current_user
    @evidence.save
    redirect_to evidences_path
  end

  def disapprove
    @evidence = Evidence.find(params[:id])
    @evidence.destroy
    redirect_to evidences_path
  end

  private

  def evidence_params
    params.require(:evidence).permit(:description)
  end

  def valid_until_date(requirement)
    if requirement.within_months?
      Time.now + requirement.within_months.months
    end
  end
end
