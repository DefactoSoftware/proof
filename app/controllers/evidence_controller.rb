class EvidenceController < ApplicationController
  def new
    @evidence = Evidence.new
  end

  def create
    @evidence = Evidence.new(new_evidence_params)
    @evidence.user = current_user
    @evidence.requirement = Requirement.find(params[:requirement_id])
    @evidence.valid_until = valid_until_date
    if @evidence.save
      redirect_to requirements_path
    else
      render 'new'
    end
  end

  private

  def new_evidence_params
    params.require(:evidence).permit(:description)
  end

  def valid_until_date
    Time.now + @evidence.requirement.within_months.months
  end
end
