class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :address
      t.integer :primary_phone
      t.integer :secondary_phone
      t.string :primary_email
      t.string :secondary_email

      t.timestamps null: false
    end
  end
end
