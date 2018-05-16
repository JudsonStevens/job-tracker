class RemoveCitiesTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobs, :city_id
    drop_table :cities
  end
end
