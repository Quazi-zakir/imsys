class Course < ActiveRecord::Base
  attr_accessible :course_name

  validates :course_name, :presence => true
  validates :course_name, :uniqueness => true

end
