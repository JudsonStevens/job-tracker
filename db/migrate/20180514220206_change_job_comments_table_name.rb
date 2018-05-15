class ChangeJobCommentsTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :job_comments, :comments
  end
end
