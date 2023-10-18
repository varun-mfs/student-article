class AddStudentIdToArticles < ActiveRecord::Migration[7.1]
  def change
    add_reference :articles, :student, null: false, foreign_key: true
  end
end
