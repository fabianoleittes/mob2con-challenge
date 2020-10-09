class AddRetailChainToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :retail_chain, foreign_key: true
  end
end
