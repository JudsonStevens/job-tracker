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

  def self.sort_by_interest
    order(:level_of_interest).reverse
  end
  
  def self.by_category(id)
    joins(:company).where(category_id: id)
  end

  def self.count_of_jobs_by_location
    group(:city).order('count_id DESC').count(:id)
  end

  # Ask about includes and a better way to do this
  def self.location_select(city)
    includes(:company).where(city: city)
  end
  
  def self.count_by_level_of_interest
    levels = (1..100)
    actual_counts = []
    levels.each do |level|
      actual = where(level_of_interest: level).count
      if actual == 0
        next
      else
        actual_counts << [level, actual]
      end
    end
    actual_counts
  end
end
