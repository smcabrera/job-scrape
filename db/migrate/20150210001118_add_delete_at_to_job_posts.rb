class AddDeleteAtToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :deleted_at, :datetime
    add_index :job_posts, :deleted_at
  end
end
