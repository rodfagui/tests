require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'GET /users' do
    let!(:user) { create(:user) }
    let!(:other_users) { create_list(:user, 2) }
    let!(:listUsersPermission) { create(:permission, action: 'list_users') }
    let!(:role) { create(:role) }

    context 'with an invalid authorization token' do
      it 'responds with 401 status code' do
        get '/users', headers: invalid_headers
        expect(response).to have_http_status(401)
      end
    end

    context 'with a valid authorization token' do
      context 'when the user has no the permission to list_users' do
        it 'responds with 403 status code' do
          get '/users', headers: authenticated_header(user)
          expect(response).to have_http_status(403)
        end
      end

      context 'when the user has the permission to list_users' do
        before :each do
          role.permissions << listUsersPermission
          user.roles << role
          get '/users', headers: authenticated_header(user)
        end
        it 'responds with 200 status code' do
          expect(response).to have_http_status(200)
        end
        it 'render the complete list of users' do
          expect(json.count).to be(other_users.count + 1)
        end
      end
    end
  end
end
