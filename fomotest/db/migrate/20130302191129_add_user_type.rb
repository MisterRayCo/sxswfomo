class AddUserType < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, :default => "normal"
  end
end
