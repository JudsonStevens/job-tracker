class JobsController < ApplicationController
  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    elsif params[:sort]
      @jobs = Job.all.sort_by_interest
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created a new job called #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  # Ask about calling @job.comments and how to do it from model, if need be.
  def show
    @job = Job.find(params[:id])
    @company = @job.company
    @comment = Comment.new
    @comments = @job.comments.order(created_at: :desc)
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:company_id])
    job = Job.find(params[:id])
    job.destroy
    flash[:success] = "#{job.title} was successfully deleted!"

    redirect_to company_jobs_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title,
                                :description,
                                :level_of_interest,
                                :city,
                                :category_id)
  end
end
