class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.text :description
      t.integer :event_id      
      t.integer :user_id
	
      t.timestamps
    end
  end
end
