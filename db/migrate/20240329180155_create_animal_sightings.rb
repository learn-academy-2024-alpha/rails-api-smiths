class CreateAnimalSightings < ActiveRecord::Migration[7.1]
  def change
    create_table :animal_sightings do |t|
      t.string :latitude
      t.string :longitude
      t.string :date

      t.timestamps
    end
  end
end
