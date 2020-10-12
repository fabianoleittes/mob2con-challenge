class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.datetime :entry_date, null: false
      t.datetime :exit_date,  null: false
      t.references :visitor, foreign_key: true

      t.timestamps
    end
  end
end
