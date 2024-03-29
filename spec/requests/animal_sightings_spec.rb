require 'rails_helper'

RSpec.describe "Animals", type: :request do
  describe "POST /animals" do
    context "when the request is invalid" do
      let(:invalid_attributes) { { common_name: nil, scientific_binomial: 'Test' } }

      it 'returns status code 422' do
        post '/animals', params: { animal: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end
end

