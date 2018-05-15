class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  has_many :comments
  belongs_to :company
  belongs_to :category

  def sort_comments
    comments.order(created_at: :desc)
  end

  def self.top_three_companies_by_job_interest
    joins(:company).group(:name).order("average_level_of_interest DESC").average(:level_of_interest).take(3)
  end

  def self.by_category(id)
    joins(:company).where(category_id: id)
  end

  def self.count_of_jobs_by_location
    group(:city).order(count_id: :desc).count(:id)
  end
  
end
