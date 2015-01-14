class Teacher < ActiveRecord::Base

  has_many  :teacher_course_sections
  has_many  :courses, through: :teacher_course_sections
  has_many  :sections, through: :teacher_course_sections

end
