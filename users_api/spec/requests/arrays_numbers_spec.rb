require 'rails_helper'

RSpec.describe 'Arrays Numbers API' do
  describe 'POST /arrays_numbers' do
    context 'with valid params' do
      before :each do
        post '/arrays_numbers',
             params: {
              arrays_number: {
                num_of_elements: 10
              }
             }
      end
      it 'responds with 201 status code' do
        expect(response).to have_http_status(201)
      end
      it 'render the created arrays number' do
        expect(json).to include 'array'
        expect(json['array']).to eq(ArraysNumber.last.array)
      end
    end
  end

  describe 'GET /arrays_numbers/:id' do
    let!(:arrays_number) { create(:arrays_number, array: '[1, 2, 0, 5, 9, 10, 13]') }

    context 'with valid params' do
      before :each do
        get "/arrays_numbers/#{arrays_number.id}"
      end
      it 'responds with 200 status code' do
        expect(response).to have_http_status(200)
      end
      it 'render the longest range of arrays_number' do
        expect(json).to include 'longest_range'
        expect(json['longest_range']).to eq([0, 2])
      end
    end
  end
end
