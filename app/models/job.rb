class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  has_many :comments
  belongs_to :company
  belongs_to :category

  def self.sort_comments
    find(Job.id).job_comments.order(:created_at)
  end

  def self.top_three_companies_by_job_interest
    joins(:company).group(:name).order("average_level_of_interest DESC").average(:level_of_interest).take(3)
  end
end
