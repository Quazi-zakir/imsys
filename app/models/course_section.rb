class CourseSection < ActiveRecord::Base
  attr_accessible :course_id, :section_id

  belongs_to :course
  belongs_to :section
end
