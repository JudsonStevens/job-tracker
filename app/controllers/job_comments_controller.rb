class JobCommentsController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @job_comments = @job.job_comments
  end

  # def new
  #   @job_comments = JobComments.new()
  # end

  def create
    @job = Job.find(params[:job_id])
    @job_comment = @job.job_comments.create!(job_comment_params)
    if @job_comment.save
      flash[:success] = "You created a comment about #{@job.title} at #{@job.company.name}!"
      redirect_to company_job_path(@job.company, @job)
    else
      flash[:failure] = "Make sure you fill in all fields to create a new comment"
      redirect_to company_job_path(@job.company, @job)
    end
  end

  private
  def job_comment_params
    params.require(:job_comment).permit(:content)
  end
end
