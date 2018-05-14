class UpdateJobsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobs, :job_comment_id
    add_reference :job_comments, :job, index: true, foreign_key: true
  end
end
