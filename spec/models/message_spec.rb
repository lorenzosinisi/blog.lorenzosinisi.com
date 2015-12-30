require 'rails_helper'

RSpec.describe Message, type: :model do
  let (:message) { Message }

  context "twilio methods" do 
    
    it "#twilio_sid" do
      expect(message.twilio_sid).to_not be nil
    end
    
    it "#twilio_secret" do
      expect(message.twilio_secret).to_not be nil
    end

    it "#twilio_client" do
      expect(message.twilio_client).to be_a Twilio::REST::Client
    end
  end

  context "# send a message" do
    it "should send me a message" do
      expect(message.send_sms(message.my_number, "Ciao")).to be_a Twilio::REST::Message
    end
    it "should raise an error if invalid number" do
      expect{message.send_sms("eqaufygweui", "Ciao")}.to raise_error
    end
  end

end
