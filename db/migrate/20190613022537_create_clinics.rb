class CreateClinics < ActiveRecord::Migration[5.1]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :city
      t.string :introduce
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
