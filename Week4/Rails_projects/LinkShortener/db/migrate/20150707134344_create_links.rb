class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :short_url
      t.integer :visits

      t.timestamps null: false
    end
  end
end
