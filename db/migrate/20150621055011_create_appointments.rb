class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
    	t.integer :status, default: 0
    	t.datetime :date_and_time
    	t.integer :length
    	t.string :customer_name
    	t.string :customer_phone_number
    	t.belongs_to :schedule, index:true

      t.timestamps null: false
    end
  end
end
