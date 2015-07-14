class AddLogoToProject < ActiveRecord::Migration
  def self.up
  	add_attachment :contacts, :logo
  end

  def self.down
  	remove_attachment :contacts, :logo
  end

end
