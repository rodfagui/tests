require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:roles) }
    it { should have_many(:role_permissions).through(:roles) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should_not allow_value('test').for(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
  end
end
