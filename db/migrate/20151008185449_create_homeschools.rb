class CreateHomeschools < ActiveRecord::Migration
  def change
    create_table :homeschools do |t|
      t.string :name
      t.integer :community_id
      
      t.timestamps
    end
  end
end
