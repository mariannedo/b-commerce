class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :item
      t.text :description
      t.string :status
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
