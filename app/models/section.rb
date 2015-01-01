class Section < ActiveRecord::Base
  attr_accessible :section_name

  validates :section_name, :presence => true
  validates :section_name, :uniqueness => true
end
