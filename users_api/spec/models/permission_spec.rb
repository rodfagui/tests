require 'rails_helper'

RSpec.describe Permission, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:roles) }
  end

  describe 'validations' do
    it { should validate_presence_of(:action) }
    it { should validate_uniqueness_of(:action) }
  end
end