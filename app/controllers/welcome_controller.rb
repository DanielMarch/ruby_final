class WelcomeController < ApplicationController
  def index
    if logged_in?
      redirect_to courses_path
    end
  end
end
