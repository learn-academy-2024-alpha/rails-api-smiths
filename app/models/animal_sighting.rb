class AnimalSighting < ApplicationRecord
    belongs_to :animal
    validates :latitude, :longitude, :date, presence: true 
end
