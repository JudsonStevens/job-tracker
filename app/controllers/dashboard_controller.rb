class DashboardController < ApplicationController
  def index
    @top_three_companies = Job.top_three_companies_by_job_interest
    @count_of_jobs_by_location = Job.count_of_jobs_by_location
    @level_of_interest = Job.count_by_level_of_interest
  end
end
