class Section < ActiveRecord::Base
  attr_accessible :section_name

  validates :section_name, :presence => true
  validates :section_name, :uniqueness => true

  has_many  :course_sections
  has_many  :courses, through: :course_sections

end
