class Message < ActiveRecord::Base
  
  # get the twilio sid
  def self.twilio_sid
    Rails.application.secrets.twilio_sid
  end

  # get the twilio secret token
  def self.twilio_secret
    Rails.application.secrets.twilio_secret
  end

  # initialize the client
  def self.twilio_client
    @client = Twilio::REST::Client.new twilio_sid, twilio_secret
  end

end
