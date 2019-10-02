class AddSummaryToUser < ActiveRecord::Migration[6.0]
  def up
    add_column(:users, :summary, :text) unless column_exists?(:users, :summary)
  end

  def down
    remove_column(:users, :summary) if column_exists?(:users, :summary)
  end
end
