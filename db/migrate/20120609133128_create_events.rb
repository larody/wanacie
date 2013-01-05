class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :purpose
      t.datetime :held_datetime
      t.string :place
      t.string :msg
      t.string :mail

      t.timestamps
    end
  end
end
