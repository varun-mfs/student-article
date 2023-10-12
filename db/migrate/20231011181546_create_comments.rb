class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :student, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.integer :status, default: 0, limit: 1

      t.timestamps
    end
  end
end
