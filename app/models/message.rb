class Message < ActiveRecord::Base
  
  # Model validations
  validates :to, presence: true
  validates :body, presence: true

  after_create :process_sms

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

  # my current number
  def self.my_number
    Rails.application.secrets.my_number
  end

  def self.default_number
    Rails.application.secrets.twilio_number
  end

  def self.send_sms(to, body, from = default_number)
    begin
      @client = twilio_client
      @client.account.messages.create({
          :from => from,
          :to => to,
          :body => body
      })
    rescue Twilio::REST::RequestError => e
        puts e.message
        nil
    end
  end

  def process_sms
    Message.send_sms(to, body)
  end

end
