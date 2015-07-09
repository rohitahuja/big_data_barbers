class Appointment < ActiveRecord::Base
	belongs_to :schedule

	after_create :reminder

  @@REMINDER_TIME = 30.minutes # minutes before appointment

	# Notify our appointment attendee X minutes before the appointment time
  def reminder
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    time_str = Time.parse(self.date_and_time.to_s).to_s
    reminder = "Hi #{self.customer_name}! Just a reminder that you have an appointment coming up at #{time_str} today."
    message = @client.account.messages.create(
      from: @twilio_number,
      to: self.customer_phone_number,
      body: reminder
    )
    puts message.to
  end

  def when_to_run
    date_and_time - @@REMINDER_TIME
  end

  handle_asynchronously :reminder, run_at: Proc.new { |i| i.when_to_run }
end
