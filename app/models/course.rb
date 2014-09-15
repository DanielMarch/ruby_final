class Course < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :subject
  # belongs_to :user
  # validates_presence_of :user
end
