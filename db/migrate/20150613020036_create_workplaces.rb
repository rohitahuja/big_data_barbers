class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.string :street
      t.string :city
      t.string :zip
      t.string :statecountry

      t.timestamps null: false
    end
  end
end
