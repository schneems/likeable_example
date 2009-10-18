class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string   :email,              :null => false
      t.string   :encrypted_password, :null => false
      t.string   :password_salt,      :null => false
      t.string   :confirmation_token
      t.datetime :confirmation_sent_at
      t.datetime :confirmed_at
      t.string   :reset_password_token

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
