require 'rails_helper'

RSpec.describe 'Clients API' do
  describe 'GET /clients' do
    let!(:user) { create(:user) }
    let!(:clients) { create_list(:client, 2) }
    let!(:listClientsPermission) { create(:permission, action: 'list_clients') }
    let!(:role) { create(:role) }

    context 'with an invalid authorization token' do
      it 'responds with 401 status code' do
        get '/clients', headers: invalid_headers
        expect(response).to have_http_status(401)
      end
    end

    context 'with a valid authorization token' do
      context 'when the user has no the permission to list_users' do
        it 'responds with 403 status code' do
          get '/clients', headers: authenticated_header(user)
          expect(response).to have_http_status(403)
        end
      end

      context 'when the user has the permission to list_users' do
        before :each do
          role.permissions << listClientsPermission
          user.roles << role
          get '/clients', headers: authenticated_header(user)
        end
        it 'responds with 200 status code' do
          expect(response).to have_http_status(200)
        end
        it 'render the complete list of clients' do
          expect(json.count).to be(clients.count)
        end
      end
    end
  end

  describe 'POST /clients' do
    let!(:user) { create(:user) }
    let!(:createClientsPermission) { create(:permission, action: 'create_clients') }
    let!(:role) { create(:role) }
    let(:valid_client) { attributes_for(:client) }

    context 'with an invalid authorization token' do
      it 'responds with 401 status code' do
        post '/clients', headers: invalid_headers
        expect(response).to have_http_status(401)
      end
    end

    context 'with a valid authorization token' do
      context 'when the user has no the permission to create_users' do
        it 'responds with 403 status code' do
          post '/clients', headers: authenticated_header(user)
          expect(response).to have_http_status(403)
        end
      end

      context 'when the user has the permission to create_users' do
        before :each do
          role.permissions << createClientsPermission
          user.roles << role
          post '/clients',
               params: valid_client,
               headers: authenticated_header(user)
        end
        it 'responds with 201 status code' do
          expect(response).to have_http_status(201)
        end
        it 'render the created client' do
          expect(json).to include 'name'
          expect(json['name']).to eq(valid_client[:name])
          expect(json).to include 'phone_number'
          expect(json['phone_number']).to eq(valid_client[:phone_number])
        end
      end
    end
  end
end
