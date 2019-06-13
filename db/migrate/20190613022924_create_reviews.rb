class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :patient, foreign_key: true
      t.references :clinic, foreign_key: true
      t.integer :score
      t.string :content
      t.timestamps
    end
  end
end
