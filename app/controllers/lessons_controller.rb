class LessonsController < ApplicationController
  before_filter :require_login

  def new
  end
end
