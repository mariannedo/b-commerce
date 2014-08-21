class AddUserToListing < ActiveRecord::Migration
  def change
    change_table :listings do |t|
      t.belongs_to :user, index: true
    end
  end
end
