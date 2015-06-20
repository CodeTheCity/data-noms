require 'rails_helper'

RSpec.describe DataSource, type: :model do
  describe 'validations' do
    it 'must have a name' do
      expect(subject).to be_invalid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'must have a url' do
      expect(subject).to be_invalid
      expect(subject.errors[:url]).to include("can't be blank")
    end

    it 'must have a format' do
      expect(subject).to be_invalid
      expect(subject.errors[:format]).to include("can't be blank")
    end
  end
end
