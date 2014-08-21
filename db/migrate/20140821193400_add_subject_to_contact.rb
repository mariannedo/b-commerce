class AddSubjectToContact < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.string :subject
      t.string :to_email
    end
  end
end
