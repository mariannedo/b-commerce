class AddImagefilesToListing < ActiveRecord::Migration
  def change
    change_table :listings do |t|
      t.string :image2
      t.string :image3
    end
  end
end
