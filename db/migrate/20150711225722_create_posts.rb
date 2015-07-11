class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image_id
      t.belongs_to :professional_account, index:true

      t.timestamps null: false
    end
  end
end
