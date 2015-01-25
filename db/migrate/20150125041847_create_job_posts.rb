class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.string :title
      t.string :company
      t.string :url
      t.date :date_posted

      t.timestamps
    end
  end
end
