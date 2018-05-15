class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  has_many :comments
  belongs_to :company
  belongs_to :category

  def sort_comments
    Job.find(Job.id).job_comments.order(:created_at)
  end
end
