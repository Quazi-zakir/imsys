class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_name
      t.integer :age
      t.string  :gender

      t.timestamps
    end
  end
end
