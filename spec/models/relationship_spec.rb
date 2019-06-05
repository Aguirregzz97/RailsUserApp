require 'rails_helper'

RSpec.describe Relationship, :type => :model do

  describe 'should be valid' do
    subject { build(:relationship) }
    it { should be_valid }
  end

end
