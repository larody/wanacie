class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
