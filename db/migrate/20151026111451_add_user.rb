class AddUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :encrypted_password, :null => false, :default => ""

      # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    end

   add_index :users, :email, :unique => true
   add_index :users, :confirmation_token,   :unique => true
  end
end
