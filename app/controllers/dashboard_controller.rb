class DashboardController < ApplicationController
  def index
    @top_three_companies = Job.top_three_companies_by_job_interest
    @count_of_jobs_by_location = Job.count_of_jobs_by_location
  end
end
