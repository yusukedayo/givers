class AddUserToArticles < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM articles'
		add_reference :articles, :user, null: false, index:true, foreign_key: true
	end

	def down
		remove_reference :articles, :user, index:true
	end
end
