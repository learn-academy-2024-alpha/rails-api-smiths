require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'should have a common name' do
    no_name = Animal.create(scientific_binomial:'gibberish')
    expect(no_name.errors[:common_name]).to_not be_empty
  end

  it 'should have a scientific binomial name' do
    no_binomial = Animal.create(common_name:'gibberish')
    expect(no_binomial.errors[:scientific_binomial]).to_not be_empty
  end
  
  it 'common name cannot match scientific binomial ' do
    same_name = Animal.create(common_name:'bear', scientific_binomial:'bear')
    expect(same_name.errors[:common_name].first).to include('cannot match scientific binomial')
  end

  it 'should have a unique name' do
    not_unique = Animal.create(scientific_binomial:'gibberish', common_name:'different')
    not_unique2 = Animal.create(scientific_binomial:'gibberish2', common_name:'different')
    expect(not_unique2.errors[:common_name].first).to include('has already been taken')
  end
  it 'should have a unique binomial name' do
    not_unique = Animal.create(scientific_binomial:'gibberish', common_name:'different')
    not_unique2 = Animal.create(scientific_binomial:'gibberish', common_name:'different2')
    expect(not_unique2.errors[:scientific_binomial].first).to include('has already been taken')
  end
  
  describe 'POST /animals' do
    let(:valid_attributes) { { common_name: 'Lion', scientific_binomial: 'Panthera leo' } }
    let(:invalid_attributes) { { common_name: nil, scientific_binomial: 'Test' } }

    context 'when the request is invalid' do
      it 'returns status code 422' do
        post '/animals', params: { animal: invalid_attributes }
        expect(response).to have_http_status(422)
      end

      
    end
  end
end
