class Lesson < ActiveRecord::Base
  belongs_to :course
  validates_presence_of :title, :content
end
