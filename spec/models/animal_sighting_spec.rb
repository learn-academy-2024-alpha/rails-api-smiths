require 'rails_helper'

RSpec.describe AnimalSighting, type: :model do
  it 'should have a latitude' do
    no_lat = AnimalSighting.create(longitude:'gibberish', date:'9999999')
    expect(no_lat.errors[:latitude]).to_not be_empty
  end

  it 'should have a longitude' do
    no_lon = AnimalSighting.create(latitude:'gibberish', date:'9999999')
    expect(no_lon.errors[:longitude]).to_not be_empty
  end

  it 'should have a date' do
    no_date = AnimalSighting.create(latitude:'gibberish', longitude:'gibberish' )
    expect(no_date.errors[:date]).to_not be_empty
  end
end
