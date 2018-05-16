class DashboardController < ApplicationController
  def index
    @top_three_companies = Job.top_three_companies_by_job_interest
    @jobs = Job.all
  end
end
