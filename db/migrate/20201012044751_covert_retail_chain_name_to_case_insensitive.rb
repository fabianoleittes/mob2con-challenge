# frozen_string_literal: true

class CovertRetailChainNameToCaseInsensitive < ActiveRecord::Migration[6.0]
  def up
    enable_extension 'citext'
    change_column :retail_chains, :name, :citext
  end

  def down
    change_column :retail_chains, :name, :string
    disable_extension 'citext'
  end
end
