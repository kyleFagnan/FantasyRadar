require 'twilio-ruby'

module NotificationHelper
  # send notification via Twilio
  def self.sendText(message_body, recipient)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
  
    
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      from: ENV['PHONE_FROM'],
      to: recipient,
      body: message_body
      )
  end

  def self.sendEmail
  end
end