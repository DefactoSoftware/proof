class EvidencesController < ApplicationController
  def new
    @evidence = Evidence.new
  end

  def create
    @evidence = Evidence.new(new_evidence_params)
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
    if @evidence.update(new_evidence_params)
      redirect_to requirements_path
    else
      render 'edit'
    end
  end

  private

  def new_evidence_params
    params.require(:evidence).permit(:description)
  end

  def valid_until_date(requirement)
    if requirement.within_months?
      Time.now + requirement.within_months.months
    end
  end
end
