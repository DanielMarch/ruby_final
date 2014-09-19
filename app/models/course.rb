class Course < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :subject
  has_many :lessons
end
