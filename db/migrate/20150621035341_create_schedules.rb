class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
    	t.belongs_to :professional, index:true

      t.timestamps null: false
    end
  end
end
