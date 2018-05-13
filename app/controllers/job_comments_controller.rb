class JobCommentsController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @job_comments = @job.job_comments
  end

end