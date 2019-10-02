class CreateBlogs < ActiveRecord::Migration[6.0]
  def up
    create_table :blogs do |t|
      t.string :title
      t.text :summary

      t.timestamps
    end unless table_exists?(:blogs)
  end

  def down
    drop_table(:blogs) if table_exists?(:blogs)
  end
end
