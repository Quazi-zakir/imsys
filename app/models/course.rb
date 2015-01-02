class Course < ActiveRecord::Base

  validates :course_name, :presence => true
  validates :course_name, :uniqueness => true

  has_many  :course_sections
  has_many  :sections, through: :course_sections

end
