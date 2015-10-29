class PagesController < ApplicationController
  def index
    render layout: "landing"
  end
end
