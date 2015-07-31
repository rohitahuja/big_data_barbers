class CreateProfessionalAccounts < ActiveRecord::Migration
  def change
    create_table :professional_accounts do |t|
      t.string :phone_number
      t.text :bio
      t.string :profile_image_id
      t.belongs_to :user, index: true
      t.belongs_to :workplace, index: true

      t.timestamps null: false
    end
  end
end
