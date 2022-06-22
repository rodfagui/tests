require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_numericality_of(:phone_number) }
    it { should validate_length_of(:phone_number).is_equal_to(10) }
  end
end
