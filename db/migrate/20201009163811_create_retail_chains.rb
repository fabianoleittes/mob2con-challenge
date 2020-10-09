class CreateRetailChains < ActiveRecord::Migration[6.0]
  def change
    create_table :retail_chains do |t|
      t.string :name, null: false, default: '', index: true
      t.string :cnpj, null: false, default: ''

      t.timestamps
    end
  end
end
