class CreateTrachers < ActiveRecord::Migration
  def change
    create_table :trachers do |t|
      t.string  :teacher_name
      t.string  :gender
      t.integer :age

      t.timestamps
    end
  end
end
