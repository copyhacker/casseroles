class AddContact < ActiveRecord::Migration
  def self.up
    create_table :contacts, :force => true do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
