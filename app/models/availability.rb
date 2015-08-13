class Availability < ActiveRecord::Base
	belongs_to :schedule, inverse_of: :availabilities

	validates :day_of_week, :start_time, :end_time, :schedule, presence: true
	validate :end_time_after_start_time, :availability_cannot_overlap

	def end_time_after_start_time
		errors.add(:start_time, "Start time cannot occur after the end time") if start_time >= end_time
	end

	def availability_cannot_overlap
		availabilities = Availability.where('day_of_week = ? AND schedule_id = ? AND ((start_time <= ? AND ? <= end_time) OR (start_time <= ? AND ? <= end_time))', 
																				day_of_week, schedule_id, start_time, start_time, end_time, end_time)

		errors.add(:start_time, "Overlapping availability") if !availabilities.blank?
	end
end
