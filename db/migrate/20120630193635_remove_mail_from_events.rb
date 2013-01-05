class RemoveMailFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :mail
  end

  def down
    add_column :events, :mail, :string
  end
end
