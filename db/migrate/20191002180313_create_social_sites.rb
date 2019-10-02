class CreateSocialSites < ActiveRecord::Migration[6.0]
  def up
    create_table :social_sites do |t|
      t.string :title
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end unless table_exists?(:social_sites)
  end

  def down
    drop_table(:social_sites) if table_exists?(:social_sites)
  end
end
