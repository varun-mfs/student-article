class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone

      t.timestamps
    end
  end
end
