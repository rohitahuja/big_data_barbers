class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :zip # zip/postal code
      t.string :state # state/province/region
      t.string :country

      t.timestamps null: false
    end
  end
end
