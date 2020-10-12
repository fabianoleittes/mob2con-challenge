# frozen_string_literal: true

class CovertVisitorNameToCaseInsensitive < ActiveRecord::Migration[6.0]
  def up
    enable_extension 'citext'
    change_column :visitors, :name, :citext
  end

  def down
    change_column :visitors, :name, :string
    disable_extension 'citext'
  end
end
