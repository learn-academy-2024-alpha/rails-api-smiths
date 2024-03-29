class Animal < ApplicationRecord
    has_many :animal_sightings
    validates :common_name, :scientific_binomial, presence: true 
    validates :common_name, exclusion: { in: ->(animal) { [animal.scientific_binomial] }, message: 'cannot match scientific binomial' }
    validates :common_name, :scientific_binomial, uniqueness: true 
end
