class AddContactPhone < ActiveRecord::Migration
  def self.up
    add_column :contacts, :phone, :string
  end

  def self.down
    remove_column :contacts, :phone
  end
end
