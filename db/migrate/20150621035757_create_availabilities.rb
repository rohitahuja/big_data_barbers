class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
    	t.integer :day_of_week
    	t.time :start_time
    	t.time :end_time
   		t.belongs_to :schedule

      t.timestamps null: false
    end
  end
end
