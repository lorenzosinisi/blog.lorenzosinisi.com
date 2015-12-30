require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /messages" do
    it "works! (now write some real specs)" do
      expect{get messages_path}.to raise_error(CanCan::AccessDenied)
    end
  end
end
