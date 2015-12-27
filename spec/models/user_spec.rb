require 'spec_helper'

describe User do
  
  let(:user) { FactoryGirl.build(:user) }

  it "should have admin attribute set to false by default" do
    expect(user.admin).to be false
  end

  describe "#admin?" do 
    it "should be true when the user is an admin" do 
      user.admin = true
      expect(user.admin?).to be true
    end
    it "false if it is a normal user" do
      expect(user.admin?).to be false
    end
  end
end
