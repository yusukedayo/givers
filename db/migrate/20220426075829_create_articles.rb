class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :url, null: false
      t.text :body
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
