class AddForiegnKeyToSightings < ActiveRecord::Migration[7.1]
  def change
    add_column :animal_sightings, :animal_id, :integer
  end
end
