require "rails_helper"

# binding.pry to debug


RSpec.describe User, :type => :model do
    
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }

    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should have_secure_password() }

    it "email has valid address" do
        isValid = true
        user = build(:user)
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
        first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
        user.email = valid_address
        isValid =  user.valid?, "#{valid_address.inspect} should be valid"
        end
        if isValid
            expect(user).to be_valid
        else
            expect(user).to_not be_valid
        end
    end
    
end