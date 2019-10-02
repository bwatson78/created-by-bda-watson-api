class AddBlogToPost < ActiveRecord::Migration[6.0]
  def up
    add_reference(:posts, :blog, null: false, foreign_key: true) unless column_exists?(:posts, :blog_id)
  end

  def down
    remove_reference(:posts, :blog, null: false, foreign_key: true) if column_exists?(:posts, :blog_id)
  end
end
