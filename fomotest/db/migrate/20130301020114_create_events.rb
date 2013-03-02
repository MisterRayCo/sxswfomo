class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :url
      t.string :speakers
      t.datetime :date
      t.string :address

      t.timestamps
    end
  end
end
