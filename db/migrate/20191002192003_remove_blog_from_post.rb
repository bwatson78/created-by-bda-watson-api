class RemoveBlogFromPost < ActiveRecord::Migration[6.0]
  def up
    remove_column(:posts, :blog) if column_exists?(:posts, :blog)
  end

  def down
    add_column(:posts, :blog, :string) unless column_exists?(:posts, :blog)
  end
end
