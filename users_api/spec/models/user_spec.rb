require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:roles) }
    it { should have_many(:role_permissions).through(:roles) }
  end

  describe 'validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should_not allow_value('test').for(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
  end

  describe 'methods' do
    describe 'has_permission?' do
      context 'when role user has a permission' do
        it 'returns true' do
          user = create(:user)
          role = create(:role)
          permission = create(:permission)
          user.roles << role
          role.permissions << permission
          expect(user.has_permission?(permission.action)).to eq(true)
        end
      end

      context 'when role user has not a permission' do
        it 'returns false' do
          user = create(:user)
          role = create(:role)
          permission = create(:permission)
          user.roles << role
          expect(user.has_permission?(permission.action)).to eq(false)
        end
      end
    end
  end
end
