class CreateStudentCourseSections < ActiveRecord::Migration
  def change
    create_table :student_course_sections do |t|
      t.belongs_to :course, index: true
      t.belongs_to :section, index: true
      t.belongs_to :student, index: true

      t.timestamps
    end
  end
end
