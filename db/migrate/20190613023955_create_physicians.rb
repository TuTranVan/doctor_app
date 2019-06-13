class CreatePhysicians < ActiveRecord::Migration[5.1]
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :gender
      t.date :dob
      t.string :email
      t.string :phone
      t.references :clinic, foreign_key: true
      t.references :major, foreign_key: true
      t.timestamps
    end
  end
end
