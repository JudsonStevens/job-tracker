class CommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    if @comment.save
      flash[:success] = "You created a comment about #{@job.title} at #{@job.company.name}!"
    else
      flash[:failure] = "Make sure you fill in all fields to create a new comment"
    end
    redirect_to company_job_path(@job.company, @job)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
