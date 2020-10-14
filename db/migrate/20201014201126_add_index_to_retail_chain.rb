class AddIndexToRetailChain < ActiveRecord::Migration[6.0]
  def change
    add_index :retail_chains, :cnpj
  end
end
