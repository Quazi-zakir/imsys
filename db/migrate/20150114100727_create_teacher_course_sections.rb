class CreateTeacherCourseSections < ActiveRecord::Migration
  def change
    create_table :teacher_course_sections do |t|
      t.belongs_to :course_section, index: true
      t.belongs_to :teacher, index: true

      t.timestamps
    end
  end
end
