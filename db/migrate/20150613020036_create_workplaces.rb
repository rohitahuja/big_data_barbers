class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.string :country
      t.belongs_to :professional_account, index:true

      t.timestamps null: false
    end
  end
end
