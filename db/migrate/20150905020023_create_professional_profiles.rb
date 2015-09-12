class CreateProfessionalProfiles < ActiveRecord::Migration
  def change
    create_table :professional_profiles do |t|
    	t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.text :bio
      t.string :image
      t.belongs_to :professional, index: true
      t.belongs_to :professional_profile, index: true

      t.timestamps null: false
    end
  end
end
