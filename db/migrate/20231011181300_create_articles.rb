class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :status, default: 0, limit: 1

      t.timestamps
    end
  end
end
