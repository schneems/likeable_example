class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :email,              :null => false
      t.string :encrypted_password, :null => false
      t.string :password_salt,      :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
