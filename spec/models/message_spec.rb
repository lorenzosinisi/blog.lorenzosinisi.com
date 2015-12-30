require 'rails_helper'

RSpec.describe Message, type: :model do
  let (:message) { Message }
  
  before(:each) do
    Rails.application.secrets.twilio_sid = "ciao"
    Rails.application.secrets.twilio_secret = "thisisasecret"
  end

  context "twilio methods" do 
    it "#twilio_sid" do
      expect(message.twilio_sid).to eq "ciao"
    end
    it "#twilio_secret" do
      expect(message.twilio_secret).to eq "thisisasecret"
    end
    it "#twilio_client" do
      expect(message.twilio_client).to be_a Twilio::REST::Client
    end
  end

end
