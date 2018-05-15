class UpdateCitiesWithJobId < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :city, index: true, foreign_key: true
  end
end
