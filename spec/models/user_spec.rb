require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of :email}
  it { should  validate_presence_of :name }
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is not valid without password" do
    expect(FactoryGirl.build(:user, :password => "")).to_not be_valid
  end
  
end
