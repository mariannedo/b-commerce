class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :story
      t.decimal :price
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end
