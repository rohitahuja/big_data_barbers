class CreateServiceDetails < ActiveRecord::Migration
  def change
    create_table :service_details do |t|
    	t.integer :duration
    	t.integer :price
    	t.belongs_to :service, index: true
    	t.belongs_to :professional, index: true
    	t.belongs_to :shop, index: true

      t.timestamps null: false
    end
  end
end
