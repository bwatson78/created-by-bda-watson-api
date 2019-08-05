class CreatePosts < ActiveRecord::Migration[6.0]
	
	def up
	  	unless table_exists? :posts
		    create_table :posts do |t|
			    t.string :title
			    t.text :content
			    t.string :blog

			    t.timestamps
		    end
		end
  	end

  	def down
  		drop_table :posts if table_exists? :posts
  	end

end
