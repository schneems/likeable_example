class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email,              :null => false
      t.string :encrypted_password, :null => false
      t.string :password_salt,      :null => false
      t.string :perishable_token,   :null => false
      t.datetime :confirmed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
