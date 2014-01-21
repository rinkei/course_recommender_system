class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :grade
      t.references :department, index: true
      t.text :introduction
      t.text :aim

      t.timestamps
    end
  end
end
