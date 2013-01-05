class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants, :options => 'ENGINE=InnoDB' do |t|
      t.references :event
      t.references :user
      t.boolean :organizer

      t.timestamps
    end
    add_index :participants, :event_id
    add_index :participants, :user_id
  end
end
