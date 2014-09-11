class WelcomeController < ApplicationController
  def index
    if logged_in?
      redirect_to students_path
    end
  end
end
