class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.integer :grade
      t.references :department, index: true

      t.timestamps
    end
  end
end
