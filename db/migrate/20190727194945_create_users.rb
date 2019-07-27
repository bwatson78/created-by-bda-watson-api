class CreateUsers < ActiveRecord::Migration[6.0]

  def up
  	unless table_exists? :users
	    create_table :users do |t|
	      t.string :email
	      t.string :password_digest
	      t.boolean :admin, default: false

	      t.timestamps
	    end
	end
  end

  def down
  	drop_table :users if table_exists? :users
  end

end
