class Appointment < ActiveRecord::Base
	belongs_to :schedule, inverse_of: :appointments

  phony_normalize :customer_phone_number

  validates :date_and_time, :customer_name, :schedule, presence: true
  validates :customer_phone_number, presence: true, phony_plausible: true
  validates :status, presence: true, inclusion: { in: [-1, 0, 1] }
  validates :length, presence: true, numericality: { greater_than: 0 }
  validate :date_and_time_is_after_now

	after_create :reminder

  @@REMINDER_TIME = 30.minutes # minutes before appointment

	# notify our appointment attendee X minutes before the appointment time
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

  def date_and_time_is_after_now
    errors.add(:date_and_time, "Date and time of appointment needs to be after now") if date_and_time < DateTime.now
  end

  handle_asynchronously :reminder, run_at: Proc.new { |i| i.when_to_run }
end
