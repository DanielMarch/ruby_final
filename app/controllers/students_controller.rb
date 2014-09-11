class StudentsController < ApplicationController
  before_filter :require_login
end
