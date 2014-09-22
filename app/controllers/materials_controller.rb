class MaterialsController < ApplicationController
  before_filter :require_login

  def show
    @courses = Course.all
  end
end
