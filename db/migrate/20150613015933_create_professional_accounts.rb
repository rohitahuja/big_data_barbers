class CreateProfessionalAccounts < ActiveRecord::Migration
  def change
    create_table :professional_accounts do |t|
      t.string :phone_number
      t.text :bio
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
