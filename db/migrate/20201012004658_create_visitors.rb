class CreateVisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :visitors do |t|
      t.string :name, null: false, default: '', index: true
      t.references :retail_chain, foreign_key: true

      t.timestamps
    end
  end
end
