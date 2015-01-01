class CreateCourseSections < ActiveRecord::Migration
  def change
    create_table :course_sections do |t|
      t.belongs_to :course, index: true
      t.belongs_to :section, index: true

      t.timestamps
    end
  end
end
