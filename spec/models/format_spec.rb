require 'rails_helper'

RSpec.describe Format, type: :model do
  describe 'validations' do
    it 'must have a name' do
      expect(subject).to be_invalid
      expect(subject.errors[:name]).to include("can't be blank")
    end
  end
end
