class CreateShopProfiles < ActiveRecord::Migration
  def change
    create_table :shop_profiles do |t|
    	t.string :name
    	t.string :address_1
      t.string :address_2
      t.string :city
      t.string :zip # zip/postal code
      t.string :state # state/province/region
      t.string :country
      t.string :image
    	t.belongs_to :shop, index: true

      t.timestamps null: false
    end
  end
end
