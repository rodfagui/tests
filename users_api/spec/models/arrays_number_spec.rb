require 'rails_helper'

RSpec.describe ArraysNumber, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:array) }
  end
end