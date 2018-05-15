class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  has_many :job_comments
  belongs_to :company
  belongs_to :category

  def sort_comments
    Job.find(Job.id).job_comments.order(:created_at)
  end

  def self.by_category(id)
    joins(:company).where(category_id: id)
  end
  
end
