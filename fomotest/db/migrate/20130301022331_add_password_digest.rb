class AddPasswordDigest < ActiveRecord::Migration
  def up
  end

def change
  add_column :users, :password_digest, :string
  remove_column :users, :password
end

  def down
  end
end
