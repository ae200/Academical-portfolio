class AddBadgeToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :badge, :text
  end
end
