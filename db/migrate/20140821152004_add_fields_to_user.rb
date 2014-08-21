class AddFieldsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username, unique: true, index: true
    end
  end
end
