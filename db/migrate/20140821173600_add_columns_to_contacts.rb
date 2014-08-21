class AddColumnsToContacts < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :message
      t.string :nickname
    end
  end
end
