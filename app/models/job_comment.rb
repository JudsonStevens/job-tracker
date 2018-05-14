class JobComment < ApplicationRecord
  validates :content, presence: true
  belongs_to :jobs, optional: true
end
