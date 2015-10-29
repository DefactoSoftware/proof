class Api::V1::XApiStatementsController < ActionController::Base
  respond_to :json

  def create
    resource = XApiStatement.new( payload: params[:x_api_statement] )
    if resource.save
      render json: nil, status: :ok
    else
      render json: nil, status: :unprocessable_entity
    end
  end
end
