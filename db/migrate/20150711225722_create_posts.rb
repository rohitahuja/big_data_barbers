class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :image
      t.belongs_to :professional, index:true

      t.timestamps null: false
    end
  end
end
