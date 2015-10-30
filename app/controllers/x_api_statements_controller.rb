class XApiStatementsController < ApplicationController
  def index
    @statements = XApiStatement.all.order("created_at DESC")
  end
end
