class AddJobCommentIdToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :job_comment, index: true, foreign_key: true
  end
end
