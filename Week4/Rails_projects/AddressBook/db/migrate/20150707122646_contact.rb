class Contact < ActiveRecord::Migration
  def change
	add_column :contacts, :favourite, :boolean, :default => false
  end
end
