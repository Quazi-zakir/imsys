class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :teacher_name
      t.integer :age
      t.string  :gender

      t.timestamps
    end
  end
end
