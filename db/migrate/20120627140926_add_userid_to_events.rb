class AddUseridToEvents < ActiveRecord::Migration
  def change
    add_column :events, :userid, :integer
  end
end
