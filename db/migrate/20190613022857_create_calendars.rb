class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.references :patient, foreign_key: true
      t.references :clinic, foreign_key: true
      t.date :date
      t.time :time
      t.string :result
      t.integer :cost
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
