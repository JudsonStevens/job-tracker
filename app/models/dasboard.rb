class Dashboard < ApplicationRecord
  def top_three_companies_by_interest
    Job.joins(:company).group(:name).order("average_level_of_interest DESC").average(:level_of_interest).take(3)
  end
end