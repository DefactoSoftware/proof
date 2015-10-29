class XApiStatementsController < ApplicationController
  def index
    @statements = XApiStatement.all
  end
end
