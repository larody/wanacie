class RemoveUseridFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :userid
  end

  def down
    add_column :users, :userid, :string
  end
end
