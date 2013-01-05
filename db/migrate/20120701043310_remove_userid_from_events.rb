class RemoveUseridFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :userid
  end

  def down
    add_column :events, :userid, :integer
  end
end
